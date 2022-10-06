import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:promdifarm_app/domain/entities/index.dart';
import 'destination.model.dart';

class AcceptDelivery implements AcceptDeliveryEntity {
  final List<Destination> destinations;
  final List<PointLatLng> polyline;
  final BitmapDescriptor rider;
  final BitmapDescriptor outlet;
  final BitmapDescriptor dropoff;
  final LatLng origin;
  final String status;

  AcceptDelivery({
    required this.origin,
    required this.destinations,
    required this.polyline,
    required this.status,
    required this.rider,
    required this.outlet,
    required this.dropoff,
  });

  @override
  List<Object> get props => [
        destinations,
        polyline,
        rider,
        outlet,
        dropoff,
        origin,
        status,
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
