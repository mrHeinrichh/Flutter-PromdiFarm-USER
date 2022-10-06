import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/view/bloc/index.dart';

class RiderProfile extends StatelessWidget {
  const RiderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .95;

    return Scaffold(
      backgroundColor: NEUTRAL_PRIMARY_ACCENT,
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: PRIMARY,
        leading: GestureDetector(
          onTap: () {
            context.goNamed(ROUTE.STATUS);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      bottomNavigationBar: navbottom(),
      body: BlocBuilder<DeliveriesCubit, DeliveriesState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.fromLTRB(18, 20, 16, 0),
            child: Column(
              children: [
                Card(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    alignment: Alignment(0.0, -0.79),
                    child: Column(
                      children: [
                        circleAvatar(),
                        Column(
                          children: [
                            field(title: "Name"),
                          ],
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                  color: NEUTRAL_SECONDARY_BASE,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              changeLink(),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                label(title: "Mobile Number"),
                                SizedBox(
                                  width: 100,
                                ),
                                label(title: "Gender"),
                              ],
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Row(
                              children: [
                                textbox(),
                                SizedBox(
                                  width: 10,
                                ),
                                dropdown(),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Birth Date",
                                  style: TextStyle(
                                    color: NEUTRAL_SECONDARY_BASE,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            dropdown1(),
                            SizedBox(
                              width: 20,
                            ),
                            dropdown1(),
                            SizedBox(
                              width: 20,
                            ),
                            dropdown1(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      context.goNamed(ROUTE.RIDERPASSWORD);
                    },
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 19.0, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              "Change Password",
                              style: TextStyle(fontSize: 12),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 191),
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ],
                        ),
                      ),
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

  Widget label({String title = ""}) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: NEUTRAL_SECONDARY_BASE,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget field({String title = ""}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: NEUTRAL_SECONDARY_BASE,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
              width: 310,
              height: 33,
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
                    fillColor: Color.fromARGB(255, 244, 246, 248)),
              )),
        ],
      ),
    );
  }

  Widget changeLink() {
    return Container(
      height: 33,
      child: Row(
        children: [
          textbox(),
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              children: [
                Text(
                  "Change",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: DARK,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textbox() {
    return Container(
      width: 180,
      height: 33,
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
            fillColor: NEUTRAL_PRIMARY_ACCENT),
      ),
    );
  }

  Widget dropdown() {
    return Container(
      height: 33,
      width: 120,
      decoration: BoxDecoration(
          color: NEUTRAL_PRIMARY_ACCENT,
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            style: TextStyle(
              fontSize: 18.0,
            ),
            items: <String>[].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: null),
      ),
    );
  }

  Widget dropdown1() {
    return Container(
      height: 33,
      width: 90,
      decoration: BoxDecoration(
          color: NEUTRAL_PRIMARY_ACCENT,
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            style: TextStyle(
              fontSize: 18.0,
            ),
            items: <String>[].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: null),
      ),
    );
  }
}

Widget circleAvatar() {
  return Container(
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://raw.githubusercontent.com/mackignacio/promdifarm-cdn/main/icons/logo.png'),
          radius: 45.0,
        ),
        ButtonTheme(
          minWidth: 89.0,
          height: 28.0,
          child: RaisedButton(
            onPressed: () {},
            color: NEUTRAL_PRIMARY_ACCENT,
            child: Text(
              "Select Image",
              style: TextStyle(
                color: NEUTRAL_SECONDARY_BASE,
                fontSize: 11,
              ),
            ),
          ),
        ),
        Text(
          "File size: maximum 1MB\nFile Extension: .JPEG, .PNG",
          style: TextStyle(
            color: NEUTRAL_SECONDARY_BASE,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    ),
  );
}

Widget navbottom() {
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
          padding: const EdgeInsets.only(bottom: .70),
          child: RaisedButton(
            onPressed: () {},
            color: PRIMARY,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "CONFIRM",
              style: TextStyle(color: TEXT_LIGHT, fontFamily: 'Roboto'),
            ),
          ),
        ),
      ],
    ),
  );
}
