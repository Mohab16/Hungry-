import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/features/login/data/models/login_request_body_model.dart';
import 'package:hungry/features/login/data/repos/login_repo.dart';
import 'package:hungry/features/login/logic/cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  void emitLoginState (LoginRequestBodyModel loginRequestBody) async {
    emit(LoginState.loading());
    final response= await _loginRepo.login(loginRequestBody);
    response.when(
      success:(data) {
       
        emit(LoginState.success(data));
      },
       failure:(error) {
         emit(LoginState.error(error: error.apiErrorModel.message));
       },
       );
  }

}
