import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_vault.g.dart';

@Riverpod(keepAlive: true)
PhotoVault photoVault(Ref ref) => PhotoVault();

/// Thrown when the OS keychain/keystore is unavailable.
class VaultUnavailable implements Exception {
  const VaultUnavailable();
}

/// Private, encrypted storage for progress photos: AES-256-GCM, with the
/// key kept in the OS keychain/keystore (never in the database or files).
class PhotoVault {
  PhotoVault({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;
  final _cipher = AesGcm.with256bits();
  SecretKey? _key;

  static const _keyName = 'pulse.photo_vault.key';

  Future<SecretKey> _secretKey() async {
    if (_key != null) return _key!;
    try {
      var hex = await _storage.read(key: _keyName);
      if (hex == null) {
        hex = _encode(List<int>.generate(32, (_) => Random.secure().nextInt(256)));
        await _storage.write(key: _keyName, value: hex);
      }
      return _key = SecretKey(_decode(hex));
    } catch (_) {
      throw const VaultUnavailable();
    }
  }

  Future<Directory> _dir() async =>
      Directory(p.join((await getApplicationSupportDirectory()).path, 'photos')).create(recursive: true);

  /// Encrypts [bytes] to a new file; returns its name (stored as localPath).
  Future<String> store(String id, Uint8List bytes) async {
    final box = await _cipher.encrypt(bytes, secretKey: await _secretKey());
    final name = '$id.enc';
    await File(p.join((await _dir()).path, name)).writeAsBytes(box.concatenation(), flush: true);
    return name;
  }

  Future<Uint8List> read(String name) async {
    final data = await File(p.join((await _dir()).path, name)).readAsBytes();
    final box = SecretBox.fromConcatenation(
      data,
      nonceLength: _cipher.nonceLength,
      macLength: _cipher.macAlgorithm.macLength,
    );
    return Uint8List.fromList(await _cipher.decrypt(box, secretKey: await _secretKey()));
  }

  Future<void> delete(String name) async {
    final file = File(p.join((await _dir()).path, name));
    if (await file.exists()) await file.delete();
  }

  static String _encode(List<int> b) => b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  static List<int> _decode(String s) =>
      [for (var i = 0; i < s.length; i += 2) int.parse(s.substring(i, i + 2), radix: 16)];
}
