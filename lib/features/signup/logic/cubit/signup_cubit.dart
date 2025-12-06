import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/features/signup/data/models/signup_request_body_model.dart';
import 'package:hungry/features/signup/data/repo/signup_repo.dart';
import 'package:hungry/features/signup/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? profileImage;
  SignupCubit(this._signupRepo) : super(SignupState.initial());

  void emitSignupState(SignupRequestBodyModel signupRequestBody) async {
    emit(SignupState.loading());
    final response = await _signupRepo.signup(signupRequestBody);
    response.when(
      success: (data) {
        emit(SignupState.success(data));
      },
      failure: (error) {
        emit(SignupState.error(error: error.apiErrorModel.message));
      },
    );
  }
    @override
  Future<void> close() {
    // تنظيف الـ controllers
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
