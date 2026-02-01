import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/storage/local_storage.dart';
import 'package:hungry/features/auth_gate/logic/cubit/auth_gate_state.dart';


class AuthGateCubit extends Cubit<AuthGateState> {
  AuthGateCubit() : super(AuthGateState.loading());
  Future <void> checkAuth() async{
    final token=await LocalStorage.getToken();

    if(token==null||token.isEmpty){
      print("AuthGate: User is Unauthenticated");
      emit(AuthGateState.unauthenticated());
      

    }else{
            print("AuthGate: User is Authenticated");

      emit(AuthGateState.authenticated());
    }
  }

  Future <void> logout() async {
    await LocalStorage.clearAll();
    emit(AuthGateState.unauthenticated());
  }
}
