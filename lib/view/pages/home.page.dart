import 'package:flutter/material.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: PRIMARY,
      ),
      body: Center(
        child: Text('My Page!'),
      ),
      drawer: Shared.sideNav(context),
    );
  }
}
