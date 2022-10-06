import 'package:promdifarm_app/domain/entities/index.dart';
import 'location.model.dart';

class Destination implements DestinationEntity {
  final Location loc;
  final String info;
  final String title;
  final String type;

  Destination({
    required this.loc,
    this.info = "",
    this.title = "",
    this.type = "",
  });

  @override
  List<Object> get props => [
        loc,
        info,
        title,
        type,
      ];

  @override
  bool? get stringify => throw UnimplementedError();

  factory Destination.fromJson(Map<String, dynamic> json) {
    return new Destination(
      loc: json["loc"] == null
          ? new Location(coordinates: [])
          : new Location.fromJson(json["loc"]),
      info: json["info"] ?? "",
      title: json["title"] ?? "",
      type: json["type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "loc": loc,
      "info": info,
    };
  }
}
