
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_gate_state.freezed.dart';

@Freezed()
class AuthGateState with _$AuthGateState {
  const factory AuthGateState.loading() = Loading;
  const factory AuthGateState.authenticated() = Authenticated;
  const factory AuthGateState.unauthenticated() = Unauthenticated;
}
