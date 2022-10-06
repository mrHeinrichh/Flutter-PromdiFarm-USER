// ignore_for_file: non_constant_identifier_names
import 'package:flutter_dotenv/flutter_dotenv.dart';

String TOKEN = dotenv.get('TOKEN_NAME', fallback: 'promdi_token');
String CDN = dotenv.get('CDN', fallback: '');

class GOOGLE {
  static const String DIRECTION_API =
      "https://maps.googleapis.com/maps/api/directions/json?";

  static String get KEY {
    return dotenv.get('GOOGLE_KEY', fallback: '');
  }
}

class ICON {
  static String get STATUS {
    return CDN + "icons/status.png";
  }

  static String get DELIVERIES {
    return CDN + "icons/deliveries.png";
  }

  static String get GREEN_PENCIL {
    return CDN + "icons/green-pencil.png";
  }

  static String get MAP {
    return CDN + "icons/map.png";
  }

  static String get HISTORY {
    return CDN + "icons/history.png";
  }

  static String get HOME {
    return CDN + "icons/home.png";
  }

  static String get PROFILE {
    return CDN + "icons/profile.png";
  }

  static String get CALENDAR {
    return CDN + "icons/calendar.png";
  }

  static String get WALLET {
    return CDN + "icons/wallet.png";
  }

  static String get HELP {
    return CDN + "icons/help.png";
  }

  static String get FEEDBACK {
    return CDN + "icons/feedback.png";
  }

  static String get INVITE_FRIENDS {
    return CDN + "icons/invite-friends.png";
  }

  static String get SETTINGS {
    return CDN + "icons/settings.png";
  }

  static String get LOGOUT {
    return CDN + "icons/logout.png";
  }

  static String get RIDER {
    return CDN + "icons/rider.png";
  }

  static String get OUTLET {
    return CDN + "icons/outlet.png";
  }

  static String get DROPOFF {
    return CDN + "icons/dropoff.png";
  }
}

class ROUTE {
  static const String STATUS = "status";
  static const String DELIVERIES = "deliveries";
  static const String MAP = "map";
  static const String HISTORY = "history";
  static const String LOGIN = "login";
  static const String SIGN_UP = "sign-up";
  static const String FORGET_PW = "forget-password";
  static const String WALLET = "wallet";
  static const String RIDERPROFILE = "rider-profile";
  static const String RIDERPASSWORD = "rider-password";
  static const String RIDERDELIVERIES = "rider-deliveries";
  static const String HELPCENTRE = "help-centre";
  static const String FEEDBACK = "feedback";
  static const String TRANSACTION = "delivery-transaction";
}
