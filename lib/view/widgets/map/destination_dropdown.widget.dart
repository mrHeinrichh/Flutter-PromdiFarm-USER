import 'package:flutter/material.dart';
import 'package:promdifarm_app/data/models/destination.model.dart';

class DestinationDropdown extends StatelessWidget {
  final List<Destination> destinations;

  DestinationDropdown({
    this.destinations = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: DropdownButton(
        value: destinations.first,
        isExpanded: true,
        dropdownColor: Colors.green,
        elevation: 16,
        alignment: Alignment.centerRight,
        style: const TextStyle(color: Colors.black),
        items: destinations
            .map<DropdownMenuItem<Destination>>(
              (Destination value) => DropdownMenuItem<Destination>(
                value: value,
                child: Center(
                  child: Text(
                    value.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (dynamic value) {
          print("$value");
        },
      ),
    );
  }
}
