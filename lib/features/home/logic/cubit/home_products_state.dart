
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_products_state.freezed.dart';
@Freezed()
class HomeProductsState<T> with _$HomeProductsState {
  const factory HomeProductsState.initial() = _Initial;
  const factory HomeProductsState.loading() = Loading;
  const factory HomeProductsState.success({required List products}) = Success;
  const factory HomeProductsState.error({required String error}) = Error;
}
