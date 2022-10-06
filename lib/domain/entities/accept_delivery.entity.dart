import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'base.entity.dart';
import 'destination.entity.dart';

@immutable
abstract class AcceptDeliveryEntity extends BaseEntity {
  final List<DestinationEntity> destinations;
  final List<PointLatLng> polyline;
  final BitmapDescriptor rider;
  final BitmapDescriptor outlet;
  final BitmapDescriptor dropoff;
  final LatLng origin;
  final String status;

  AcceptDeliveryEntity({
    required this.origin,
    required this.destinations,
    required this.polyline,
    required this.status,
    required this.rider,
    required this.outlet,
    required this.dropoff,
  });
}
