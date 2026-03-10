import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_order_details_state.freezed.dart';

@Freezed()
class MyOrderDetailsState<T> with _$MyOrderDetailsState {
  const factory MyOrderDetailsState.initial() = _Initial;
  const factory MyOrderDetailsState.loading() = Loading;
  const factory MyOrderDetailsState.success(T data) = Success<T>;
  const factory MyOrderDetailsState.error({required String error}) = Error;
}
