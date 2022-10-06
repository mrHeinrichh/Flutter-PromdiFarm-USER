import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:promdifarm_app/data/repositories/index.dart';
part 'user.state.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository repository;

  UserCubit({required this.repository}) : super(UserInitial());

  void loginUser({String cred = "", String pass = ""}) {
    emit(AuthUserLoading());

    if (cred.isEmpty || pass.isEmpty) {
      emit(AuthUserFail(msg: "Fields are empty"));
      return;
    }

    repository.loginUser(cred: cred, pass: pass).then(
      (res) async {
        if (res.status != "success") {
          emit(AuthUserFail(msg: res.message));
          return;
        }

        await this.repository.setToken(token: res.meta.token);
        emit(AuthUserSuccess(msg: res.message));
      },
    );
  }

  void createUser({
    String firstName: "",
    String lastName: "",
    String phoneNumber: "",
    String email: "",
  }) {
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        phoneNumber.isEmpty ||
        email.isEmpty) {
      emit(CreateUserFail(msg: "Fields are empty"));
      return;
    }

    repository
        .createUser(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
    )
        .then(
      (res) {
        if (res.status != "success") {
          emit(CreateUserFail(msg: res.message));
          return;
        }

        emit(CreateUserSuccess(msg: res.message));
        return;
      },
    );
  }
}
