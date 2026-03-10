import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/features/my_orders/data/repos/my_order_details_repo.dart';
import 'package:hungry/features/my_orders/logic/cubit/my_order_details_state.dart';

class MyOrderDetailsCubit extends Cubit<MyOrderDetailsState> {
  MyOrderDetailsCubit(this._myOrderDetailsRepo)
    : super(MyOrderDetailsState.initial());
  final MyOrderDetailsRepo _myOrderDetailsRepo;

  emitOrderDetails(String id) async {
    emit(MyOrderDetailsState.loading());

    final response = await _myOrderDetailsRepo.fetchOrderDetails(id);
    response.when(
      success: (data) {
        emit(MyOrderDetailsState.success(data));
        print("Success");
      },
      failure: (error) {
        emit(MyOrderDetailsState.error(error: error.apiErrorModel.message));
      },
    );
  }
}
