import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/drift_activity_repository.dart';
import '../domain/cardio_session.dart';
import '../domain/route_point.dart';

part 'activity_providers.g.dart';

@riverpod
Future<CardioSession?> cardioById(Ref ref, String id) => ref.watch(activityRepositoryProvider).getCardio(id);

@riverpod
Future<List<RoutePoint>> cardioRoute(Ref ref, String id) => ref.watch(activityRepositoryProvider).route(id);
