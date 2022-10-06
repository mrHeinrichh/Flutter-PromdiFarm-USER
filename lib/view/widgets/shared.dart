import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/numbers.dart';
import 'package:promdifarm_app/core/const/strings.dart';

class Shared {
  static void onPressed() {}
  static void onChanged() {}
  static void onTap() {}
  static FToast fToast = FToast();

  static Widget template({
    required BuildContext context,
    required Widget body,
    required String title,
  }) {
    return Scaffold(
      appBar: appbar(title: title),
      body: Center(
        child: body,
      ),
      drawer: sideNav(context),
    );
  }

  static PreferredSizeWidget appbar({
    required String title,
  }) {
    return AppBar(
      title: Text(title),
      backgroundColor: PRIMARY,
    );
  }

  static Widget sideNav(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: PRIMARY,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          ...listTitles(context),
        ],
      ),
    );
  }

  static List<Widget> listTitles(BuildContext context) {
    return [
      Shared.listTitle(
        label: "Profile",
        asset: ICON.PROFILE,
        onTap: () {
          context.goNamed(ROUTE.RIDERPROFILE);
        },
      ),
      Shared.listTitle(
        label: "Deliveries",
        asset: ICON.WALLET,
        onTap: () {
          context.goNamed(ROUTE.RIDERDELIVERIES);
        },
      ),
      Shared.listTitle(
        label: "Help Centre",
        asset: ICON.HELP,
        onTap: () {
          context.goNamed(ROUTE.HELPCENTRE);
        },
      ),
      Shared.listTitle(
        label: "Feedback",
        asset: ICON.FEEDBACK,
        onTap: () {
          context.goNamed(ROUTE.FEEDBACK);
        },
      ),
      Shared.listTitle(
        label: "Invite friends",
        asset: ICON.INVITE_FRIENDS,
      ),
      Shared.listTitle(
        label: "Settings",
        asset: ICON.SETTINGS,
      ),
      Shared.listTitle(
        label: "Log out",
        asset: ICON.LOGOUT,
      ),
    ];
  }

  static Widget toast({
    String text = "",
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: PRIMARY,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: TEXT_LIGHT,
            ),
          ),
        ],
      ),
    );
  }

  static Widget button({
    double height = 10,
    double width = 10,
    String title = "",
    void Function() onPressed = onPressed,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: PRIMARY,
          onPrimary: TEXT_LIGHT,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
          elevation: 8.0,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  static Widget textField({
    double width = FIELD_WIDTH,
    String label = "",
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: width,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(89.0)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: NEUTRAL_PRIMARY_ACCENT,
          labelText: label,
        ),
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
          color: TEXT_PRIMARY,
        ),
        maxLines: 1,
      ),
    );
  }

  static Widget listTitle({
    String label = "",
    String asset = "",
    void Function() onTap = onTap,
  }) {
    return SizedBox(
      child: ListTile(
        leading: Image.network(
          asset,
          height: 27,
          width: 27,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: TEXT_PRIMARY,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
