import 'package:drift/drift.dart';

import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/profile_tables.dart';

part 'profile_dao.g.dart';

@DriftAccessor(tables: [UsersProfile])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(super.attachedDatabase);

  SimpleSelectStatement<$UsersProfileTable, UserProfileRow> get _live =>
      select(usersProfile)
        ..where((t) => t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.createdAt)])
        ..limit(1);

  Stream<UserProfileRow?> watchProfile() => _live.watchSingleOrNull();

  Future<UserProfileRow?> getProfile() => _live.getSingleOrNull();

  /// Insert or replace the profile row, stamping it for sync.
  Future<void> upsert(UsersProfileCompanion row) => into(usersProfile).insertOnConflictUpdate(
        row.copyWith(updatedAt: Value(utcNow()), syncStatus: const Value(SyncStatus.pending)),
      );
}
