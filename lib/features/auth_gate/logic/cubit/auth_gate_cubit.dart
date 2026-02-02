import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/storage/local_storage.dart';
import 'package:hungry/features/auth_gate/logic/cubit/auth_gate_state.dart';


class AuthGateCubit extends Cubit<AuthGateState> {
  AuthGateCubit() : super(AuthGateState.loading());
  Future <void> checkAuth() async{
    final token=await LocalStorage.getToken();

    if(token==null||token.isEmpty){
      emit(AuthGateState.unauthenticated());
      

    }else{

      emit(AuthGateState.authenticated());
    }
  }

  Future <void> logout() async {
    await LocalStorage.clearAll();
    emit(AuthGateState.unauthenticated());
  }
}
