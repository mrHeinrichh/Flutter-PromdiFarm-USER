import 'package:flutter/material.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';

class NoPendingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title(),
            description(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        "You have no pending deliveries",
        style: TextStyle(
          color: TEXT_PRIMARY,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      child: Text(
        "",
        style: TextStyle(
          color: TEXT_PRIMARY,
          fontSize: 10,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
