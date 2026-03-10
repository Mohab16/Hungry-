import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/logic/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState(quantity: 0));
  void increaseQuantity() {
    emit(ProductDetailsState(quantity: state.quantity + 1));
    print(state.quantity);
  }

  void decreaseQuantity() {
    emit(ProductDetailsState(quantity: state.quantity - 1));
    print(state.quantity);
  }
}
