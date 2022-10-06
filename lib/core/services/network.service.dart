import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkService {
  String api = dotenv.get('API', fallback: 'http://10.0.2.2:3333/') + 'api/v1/';

  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> body,
    required String endpoint,
    required String token,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse(api + endpoint),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: token,
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    required String token,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(api + endpoint),
        headers: {
          HttpHeaders.authorizationHeader: token,
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> patch({
    required Map<String, dynamic> body,
    required String endpoint,
    required String token,
  }) async {
    try {
      http.Response response = await http.patch(
        Uri.parse(api + endpoint),
        body: body,
        headers: {
          HttpHeaders.authorizationHeader: token,
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      return {"message": e.toString()};
    }
  }
}
