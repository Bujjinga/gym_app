import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../core/utils/ids.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../body/data/drift_body_repository.dart';
import '../../body/data/photo_vault.dart';
import '../../body/domain/progress_photo.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/progress_providers.dart';

/// Encrypted progress photos: grid, add, and a before/after compare slider.
class PhotosScreen extends ConsumerStatefulWidget {
  const PhotosScreen({super.key});

  @override
  ConsumerState<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends ConsumerState<PhotosScreen> {
  final _selected = <ProgressPhoto>[];

  Future<void> _add(ImageSource source) async {
    final l10n = AppLocalizations.of(context);
    // Resized on pick: keeps files small and decrypt fast.
    final file = await ImagePicker().pickImage(source: source, maxWidth: 1600, imageQuality: 85);
    if (file == null) return;
    final id = newId();
    try {
      final name = await ref.read(photoVaultProvider).store(id, await file.readAsBytes());
      final weight = (await ref.read(profileRepositoryProvider).get()).weightKg;
      await ref.read(bodyRepositoryProvider).savePhoto(
            ProgressPhoto(id: id, takenAt: DateTime.now(), pose: PhotoPose.front, localPath: name, weightKg: weight),
          );
      Haptics.success();
    } on VaultUnavailable {
      if (mounted) PulseToast.show(context, l10n.vaultUnavailable, kind: ToastKind.error);
    }
  }

  void _toggle(ProgressPhoto p) => setState(() {
        if (_selected.contains(p)) {
          _selected.remove(p);
        } else {
          if (_selected.length == 2) _selected.removeAt(0);
          _selected.add(p);
        }
      });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final photos = ref.watch(progressPhotosProvider).value ?? const [];
    final canCamera = ref.watch(platformCapabilitiesProvider).isMobile;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.progressPhotos),
        actions: [
          if (_selected.length == 2)
            TextButton.icon(
              onPressed: () => showDialog<void>(context: context, builder: (_) => _CompareDialog(a: _selected[0], b: _selected[1])),
              icon: const Icon(Icons.compare_rounded),
              label: Text(l10n.compare),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add_a_photo_rounded),
        label: Text(l10n.addPhoto),
        onPressed: () => canCamera
            ? showAdaptiveSheet<void>(
                context: context,
                title: l10n.addPhoto,
                builder: (ctx) => Column(mainAxisSize: MainAxisSize.min, children: [
                  ListTile(
                    leading: const Icon(Icons.photo_camera_rounded),
                    title: Text(l10n.takePhoto),
                    onTap: () {
                      Navigator.pop(ctx);
                      _add(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library_rounded),
                    title: Text(l10n.chooseFromLibrary),
                    onTap: () {
                      Navigator.pop(ctx);
                      _add(ImageSource.gallery);
                    },
                  ),
                ]),
              )
            : _add(ImageSource.gallery),
      ),
      body: photos.isEmpty
          ? EmptyState(icon: Icons.photo_camera_back_rounded, title: l10n.noPhotos, message: l10n.noPhotosBody)
          : ListView(
              padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, 0, PulseMetrics.space16, 96),
              children: [
                Text('${l10n.photosPrivate} ${l10n.selectTwoPhotos}', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: PulseMetrics.space12),
                GridView.extent(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  maxCrossAxisExtent: 180,
                  mainAxisSpacing: PulseMetrics.space8,
                  crossAxisSpacing: PulseMetrics.space8,
                  childAspectRatio: 3 / 4,
                  children: [
                    for (final p in photos)
                      Semantics(
                        selected: _selected.contains(p),
                        button: true,
                        label: DateFormat.yMMMd().format(p.takenAt.toLocal()),
                        child: GestureDetector(
                          onTap: () => _toggle(p),
                          onLongPress: () async {
                            await ref.read(bodyRepositoryProvider).deletePhoto(p.id);
                            await ref.read(photoVaultProvider).delete(p.localPath);
                          },
                          child: Stack(fit: StackFit.expand, children: [
                            ClipRRect(borderRadius: BorderRadius.circular(context.metrics.radiusMd), child: _VaultImage(photo: p)),
                            Positioned(
                              left: 8,
                              bottom: 8,
                              child: Text(DateFormat.MMMd().format(p.takenAt.toLocal()),
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, shadows: [Shadow(blurRadius: 6)])),
                            ),
                            if (_selected.contains(p))
                              const Positioned(top: 8, right: 8, child: AnimatedCheckmark(checked: true)),
                          ]),
                        ),
                      ),
                  ],
                ),
              ],
            ),
    );
  }
}

/// Decrypts and shows one photo, scaled down for the grid.
class _VaultImage extends ConsumerWidget {
  const _VaultImage({required this.photo, this.cacheWidth = 400});

  final ProgressPhoto photo;
  final int cacheWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) => FutureBuilder<Uint8List>(
        future: ref.read(photoVaultProvider).read(photo.localPath),
        builder: (context, snap) => snap.hasData
            ? Image.memory(snap.data!, fit: BoxFit.cover, cacheWidth: cacheWidth, gaplessPlayback: true)
            : ColoredBox(color: context.colors.surfaceRaised),
      );
}

/// Drag the divider to reveal before (left) vs after (right).
class _CompareDialog extends StatefulWidget {
  const _CompareDialog({required this.a, required this.b});

  final ProgressPhoto a;
  final ProgressPhoto b;

  @override
  State<_CompareDialog> createState() => _CompareDialogState();
}

class _CompareDialogState extends State<_CompareDialog> {
  double _split = 0.5;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final (before, after) = widget.a.takenAt.isBefore(widget.b.takenAt) ? (widget.a, widget.b) : (widget.b, widget.a);
    return Dialog(
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          AspectRatio(
            aspectRatio: 3 / 4,
            child: LayoutBuilder(
              builder: (context, box) => GestureDetector(
                onHorizontalDragUpdate: (d) => setState(() => _split = (_split + d.delta.dx / box.maxWidth).clamp(0.0, 1.0)),
                child: Stack(fit: StackFit.expand, children: [
                  _VaultImage(photo: after, cacheWidth: 1000),
                  ClipRect(
                    child: Align(alignment: Alignment.centerLeft, widthFactor: _split, child: _VaultImage(photo: before, cacheWidth: 1000)),
                  ),
                  Positioned(left: box.maxWidth * _split - 1, top: 0, bottom: 0, child: Container(width: 2, color: Colors.white)),
                ]),
              ),
            ),
          ),
          Slider(
            value: _split,
            semanticFormatterCallback: (v) => '${l10n.compare} ${(v * 100).round()}%',
            onChanged: (v) => setState(() => _split = v),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(children: [
              Text(DateFormat.yMMMd().format(before.takenAt.toLocal())),
              const Spacer(),
              Text(DateFormat.yMMMd().format(after.takenAt.toLocal())),
            ]),
          ),
        ]),
      ),
    );
  }
}
