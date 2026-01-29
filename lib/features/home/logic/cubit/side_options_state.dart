
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'side_options_state.freezed.dart';
@Freezed()
class SideOptionsState<T> with _$SideOptionsState {
  const factory SideOptionsState.initial() = _Initial;
  const factory SideOptionsState.loading() = Loading;
  const factory SideOptionsState.success(T data) = Success<T>;
  const factory SideOptionsState.error({required String error}) = Error;
}
