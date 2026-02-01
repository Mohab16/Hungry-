import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/features/my_orders/data/repos/my_orders_repo.dart';
import 'package:hungry/features/my_orders/logic/cubit/my_orders_state.dart';



class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this._myOrdersRepo) : super(MyOrdersState.initial());

  final MyOrdersRepo _myOrdersRepo;

  void emitMyOrdersState() async {
    emit(MyOrdersState.loading());

    final response=await _myOrdersRepo.fetchMyOrders();

    response.when(
      success:(data) {
        emit(MyOrdersState.success(data));
        print("My orders cubit loaded");
      },
       failure:(error) {
         emit(MyOrdersState.error(error: error.apiErrorModel.message));
       },
       );
  }
}
