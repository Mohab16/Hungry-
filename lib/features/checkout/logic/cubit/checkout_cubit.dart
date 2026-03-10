import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/networking/api_result.dart';
import 'package:hungry/features/cart/data/models/order_item_model.dart';
import 'package:hungry/features/checkout/data/models/checkout_body_model.dart';
import 'package:hungry/features/checkout/data/repos/checkout_repo.dart';
import 'package:hungry/features/checkout/logic/cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo _checkoutRepo;
  CheckoutCubit(this._checkoutRepo) : super(CheckoutState.initial());

  List<OrderItem>  ordersList=[];

  emitCheckoutState(CheckOutBodyModel checkoutBodyModel) async {
    emit(CheckoutState.loading());
    final response = await _checkoutRepo.checkout(checkoutBodyModel);
    response.when(
      success:(data) {
        
        emit(CheckoutState.success(data));
      },
     failure:(error) {
       emit(CheckoutState.error(error: error.apiErrorModel.message));
     },
     );
  }
}
