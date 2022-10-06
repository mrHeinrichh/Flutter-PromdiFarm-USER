part of 'map.cubit.dart';

@immutable
abstract class MapState {
  final List<Marker> markers;
  final List<PointLatLng> points;
  late final GoogleMapController controller;
  final double zoom;
  final double tilt;
  final bool isClicked;

  MapState({
    this.markers = const [],
    this.points = const [],
    this.zoom = 20,
    this.tilt = 90,
    this.isClicked = false,
  });
}

class MapInitial extends MapState {}

class MapFail extends MapState {
  final Failure msg;
  MapFail(this.msg);
}

class MapInitialized extends MapState {
  final List<Marker> markers;
  final List<PointLatLng> points;
  final double zoom;
  final double tilt;

  MapInitialized({
    required this.points,
    required this.markers,
    required this.zoom,
    required this.tilt,
  }) : super(
          markers: markers,
          points: points,
          zoom: zoom,
          tilt: tilt,
        );
}

class MapUpdated extends MapState {
  final List<Marker> markers;
  final List<PointLatLng> points;
  final GoogleMapController controller;
  final double zoom;
  final double tilt;
  final bool isClicked;

  MapUpdated({
    required this.points,
    required this.markers,
    required this.zoom,
    required this.tilt,
    required this.controller,
    required this.isClicked,
  }) : super(
          markers: markers,
          points: points,
          zoom: zoom,
          tilt: tilt,
          isClicked: isClicked,
        );
}

class MapIdle extends MapState {
  final List<Marker> markers;
  final List<PointLatLng> points;
  final GoogleMapController controller;
  final double zoom;
  final double tilt;
  final bool isClicked;

  MapIdle({
    required this.points,
    required this.markers,
    required this.zoom,
    required this.tilt,
    required this.controller,
    required this.isClicked,
  }) : super(
          markers: markers,
          points: points,
          zoom: zoom,
          tilt: tilt,
          isClicked: isClicked,
        );
}

class MapInitController extends MapState {
  final List<Marker> markers;
  final List<PointLatLng> points;
  final GoogleMapController controller;
  final double zoom;
  final double tilt;
  final bool isClicked;

  MapInitController({
    required this.points,
    required this.markers,
    required this.zoom,
    required this.tilt,
    required this.controller,
    required this.isClicked,
  }) : super(
          markers: markers,
          points: points,
          zoom: zoom,
          tilt: tilt,
          isClicked: isClicked,
        );
}
