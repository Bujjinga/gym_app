import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_database.dart';

part 'database_provider.g.dart';

/// The app-wide database. Tests override this with an in-memory database.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase.open();
  ref.onDispose(db.close);
  return db;
}
