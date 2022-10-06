import 'package:promdifarm_app/data/models/response.model.dart';
import 'package:promdifarm_app/domain/repositories/base.repo.dart';
import 'package:promdifarm_app/core/services/index.dart';

class UsersRepository extends Repository {
  final NetworkService networkService;
  final LocalStorageService localStorage;

  UsersRepository({required this.networkService, required this.localStorage})
      : super(networkService: networkService);

  Future<Response> loginUser({cred: "", pass: ""}) async {
    var bodyReq = {"phoneNumber": cred, "password": pass};

    if (cred.toString().contains("@"))
      bodyReq = {"email": cred, "password": pass};

    final response = await networkService.post(
      body: bodyReq,
      endpoint: "users/login",
      token: await localStorage.getToken(),
    );

    return Response.fromJson(response);
  }

  Future<Response> createUser({
    String firstName: "",
    String lastName: "",
    String phoneNumber: "",
    String email: "",
  }) async {
    var bodyReq = {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email
    };

    final response = await networkService.post(
      body: bodyReq,
      endpoint: "users/rider",
      token: await localStorage.getToken(),
    );

    return Response.fromJson(response);
  }
}
