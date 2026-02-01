
import 'package:freezed_annotation/freezed_annotation.dart';
part 'checkout_state.freezed.dart';

@Freezed()
class CheckoutState<T> with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = Loading;
  const factory CheckoutState.success(T data) = Success<T>;
  const factory CheckoutState.error({required String error}) = Error;
}

