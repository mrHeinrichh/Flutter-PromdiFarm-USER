import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:go_router/go_router.dart';

class RiderPassword extends StatelessWidget {
  const RiderPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .95;

    return Scaffold(
      backgroundColor: NEUTRAL_PRIMARY_ACCENT,
      appBar: AppBar(
        title: Text("Change Password"),
        backgroundColor: PRIMARY,
        leading: GestureDetector(
          onTap: () {
            context.goNamed(ROUTE.RIDERPROFILE);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      bottomNavigationBar: bottomnav(),
      body: BlocBuilder<DeliveriesCubit, DeliveriesState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.fromLTRB(18, 20, 16, 0),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                    alignment: Alignment(0.0, -0.79),
                    child: Column(
                      children: [
                        field(
                          title: "Old Password",
                          height: 33,
                          width: 310,
                        ),
                        field(
                          title: "New Password",
                          height: 33,
                          width: 310,
                        ),
                        field(
                          title: "Re-type Password",
                          height: 33,
                          width: 310,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bottomnav() {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        alignment: FractionalOffset(.5, .40),
        children: [
          Container(
            height: 90.0,
            color: TEXT_LIGHT,
          ),
          ButtonTheme(
            minWidth: 340.0,
            height: 50,
            padding: EdgeInsets.only(bottom: .70),
            child: RaisedButton(
              onPressed: () {},
              color: PRIMARY,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Update Password",
                style: TextStyle(color: TEXT_LIGHT, fontFamily: 'Roboto'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget field({
    String title = "",
    double height = 10,
    double width = 10,
  }) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: TEXT_PRIMARY,
                  fontSize: 13,
                ),
              ),
              Text(
                " *",
                style: TextStyle(
                  color: RED,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            width: width,
            height: height,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: NEUTRAL_PRIMARY_ACCENT,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
