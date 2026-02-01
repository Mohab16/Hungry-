

import 'package:freezed_annotation/freezed_annotation.dart';
part  'my_orders_state.freezed.dart';


@Freezed()
class MyOrdersState<T> with _$MyOrdersState {
  const factory MyOrdersState.initial() = _Initial;
  const factory MyOrdersState.success(T data) = Success<T>;
  const factory MyOrdersState.loading() = Loading;
  const factory MyOrdersState.error({required String error}) = Error;
}
