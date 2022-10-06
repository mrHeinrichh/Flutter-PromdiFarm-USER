import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:promdifarm_app/core/const/strings.dart';
import 'package:promdifarm_app/core/errors/failures.dart';
import 'package:promdifarm_app/core/services/index.dart';
import 'package:promdifarm_app/core/utils/index.dart';
import 'package:promdifarm_app/data/models/index.dart';
import 'package:promdifarm_app/domain/sources/index.dart';

class DeliverySourceImp extends DeliverySource {
  static List<Delivery> list = [];
  final NetworkService netService;
  final DirectionsService dirService;
  final LocationService locService;
  final LocalStorageService localStorage;

  DeliverySourceImp({
    required this.netService,
    required this.dirService,
    required this.locService,
    required this.localStorage,
  });

  @override
  Future<List<Delivery>> fetchAvailableDeliveries() async {
    final response = await netService.get(
      endpoint: "deliveries?rider=false",
      token: await localStorage.getToken(),
    );

    Response json = Response.fromJson(response);

    if (json.status != "success") {
      throw RequestFailure(json.message);
    }

    if (json.data.length == 0) {
      list = [];
      return list;
    }

    list = json.data.map((e) => Delivery.fromJson(e)).toList();
    return list;
  }

  @override
  Future<AcceptDelivery> acceptDelivery(String id) async {
    try {
      final token = await localStorage.getToken();
      final rider = Utils.parseJwt(token)["_id"];

      var bodyReq = {
        "rider": rider,
      };

      final response = await netService.patch(
        body: bodyReq,
        endpoint: "deliveries/$id/accept",
        token: await localStorage.getToken(),
      );

      final res = Response.fromJson(response);

      if (res.status != "success") {
        throw RequestFailure("Delivery not found!");
      }

      Delivery delivery = Delivery.fromJson(res.data[0]);

      List<Destination> destinations = delivery.destinations;
      List<LatLng> waypoints = destinations.map(
        (e) {
          return LatLng(
            e.loc.coordinates[1],
            e.loc.coordinates[0],
          );
        },
      ).toList();

      await this.locService.init();
      LatLng origin = await this.locService.getCurrentLocation();

      List<PointLatLng> polylines = await this.dirService.getDirections(
            origin: origin,
            waypoints: waypoints,
            destination: LatLng(
              delivery.end.coordinates[1],
              delivery.end.coordinates[0],
            ),
          );

      return AcceptDelivery(
        status: res.status,
        origin: origin,
        polyline: polylines,
        destinations: delivery.destinations,
        rider: await Utils.bitmapFromNetwork(
          url: ICON.RIDER,
        ),
        outlet: await Utils.bitmapFromNetwork(
          url: ICON.OUTLET,
        ),
        dropoff: await Utils.bitmapFromNetwork(
          url: ICON.DROPOFF,
        ),
      );
    } catch (e) {
      throw NetworkFailure("Can't accept delivery!");
    }
  }

  @override
  List<Delivery> getDeliveries() {
    return list;
  }
}
