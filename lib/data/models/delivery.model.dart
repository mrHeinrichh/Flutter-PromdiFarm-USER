import 'package:promdifarm_app/domain/entities/index.dart';
import 'destination.model.dart';
import 'location.model.dart';

class Delivery implements DeliveryEntity {
  final String id;
  final Location start;
  final Location end;
  final List<String> orders;
  final List<Destination> destinations;
  final bool deleted;

  Delivery({
    required this.id,
    required this.start,
    required this.end,
    required this.orders,
    required this.destinations,
    required this.deleted,
  });

  @override
  List<Object> get props => [
        id,
        start,
        end,
        orders,
        destinations,
        deleted,
      ];

  @override
  bool? get stringify => throw UnimplementedError();

  factory Delivery.fromJson(Map<String, dynamic> json) {
    List<Destination> destinations = [];
    json["destinations"].forEach(
      (element) => destinations.add(
        Destination.fromJson(
          element,
        ),
      ),
    );

    List<String> orders = [];
    json["orders"].forEach((element) => orders.add(element));

    return new Delivery(
      id: json["_id"] == null ? "" : json["_id"],
      start: json["start"] == null
          ? new Location(coordinates: [])
          : new Location.fromJson(json["start"]),
      end: json["end"] == null
          ? new Location(coordinates: [])
          : new Location.fromJson(json["end"]),
      orders: orders,
      destinations: destinations,
      deleted: json["deleted"] == null ? json["deleted"] : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "start": start,
      "end": end,
      "orders": orders,
      "destinations": destinations,
      "deleted": deleted
    };
  }
}
