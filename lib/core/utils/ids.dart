import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Namespace for deterministic seed ids (exercises, prebuilt programs), so a
/// seed row has the same id on every device and never duplicates on sync.
const _seedNamespace = 'b6f4f0a2-5f3c-4c8e-9a51-7d2e3c1f9a10';

String newId() => _uuid.v4();

/// e.g. `seedId('exercise', 'barbell-bench-press')`.
String seedId(String kind, String slug) => _uuid.v5(_seedNamespace, '$kind:$slug');
