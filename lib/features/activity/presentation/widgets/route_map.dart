import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/design_system/design_system.dart';

/// Map tiles. The default public OpenStreetMap server is for development only
/// (its usage policy forbids app traffic); release builds pass a keyed provider:
///   --dart-define=MAP_TILE_URL=https://…/{z}/{x}/{y}.png?api_key=…
///   --dart-define=MAP_TILE_ATTRIBUTION="© Provider © OpenStreetMap contributors"
const _tileUrl = String.fromEnvironment('MAP_TILE_URL', defaultValue: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png');
const _tileAttribution = String.fromEnvironment('MAP_TILE_ATTRIBUTION', defaultValue: 'OpenStreetMap contributors');

/// Map with a route polyline, start marker and an optional moving
/// marker (live position or replay). Fits the route unless [follow] is set.
class RouteMap extends StatelessWidget {
  const RouteMap({super.key, required this.route, this.marker, this.follow = false, this.controller});

  final List<LatLng> route;

  /// Highlighted point: current position (live) or replay head.
  final LatLng? marker;

  /// Keep the camera on [marker] (live tracking).
  final bool follow;
  final MapController? controller;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final fit = route.length >= 2 && !follow;
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: marker ?? (route.isNotEmpty ? route.last : const LatLng(0, 0)),
        initialZoom: route.isEmpty ? 2 : 16,
        initialCameraFit:
            fit ? CameraFit.bounds(bounds: LatLngBounds.fromPoints(route), padding: const EdgeInsets.all(40)) : null,
      ),
      children: [
        TileLayer(urlTemplate: _tileUrl, userAgentPackageName: 'com.example.gym_app'),
        if (route.length >= 2)
          PolylineLayer(polylines: [
            Polyline(points: route, strokeWidth: 9, color: c.background.withValues(alpha: 0.5)),
            Polyline(points: route, strokeWidth: 5, gradientColors: [c.accentStart, c.accentEnd]),
          ]),
        MarkerLayer(markers: [
          if (route.isNotEmpty) Marker(point: route.first, width: 16, height: 16, child: _Dot(color: c.success)),
          if (marker != null)
            Marker(point: marker!, width: 26, height: 26, child: _Dot(color: c.accentEnd, glow: true)),
        ]),
        const RichAttributionWidget(attributions: [TextSourceAttribution(_tileAttribution)]),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color, this.glow = false});

  final Color color;
  final bool glow;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: glow ? [BoxShadow(color: color.withValues(alpha: 0.6), blurRadius: 16, spreadRadius: 4)] : null,
        ),
      );
}
