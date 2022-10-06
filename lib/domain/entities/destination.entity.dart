import 'package:flutter/widgets.dart';
import 'package:promdifarm_app/domain/entities/location.entity.dart';
import 'base.entity.dart';

@immutable
abstract class DestinationEntity extends BaseEntity {
  final LocationEntity loc;
  final String info;
  final String title;
  final String type;

  DestinationEntity({
    required this.loc,
    this.info = "",
    this.title = "",
    this.type = "",
  });
}
