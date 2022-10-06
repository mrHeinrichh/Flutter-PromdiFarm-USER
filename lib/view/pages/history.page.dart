import 'package:flutter/material.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shared.template(
      context: context,
      body: Scaffold(),
      title: "History",
    );
  }
}
