import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:raam_dhulaai/src/auth/entities/user_login_entity.dart';

part 'user_login_form_state.freezed.dart';

@freezed
class UserLoginFormState with _$UserLoginFormState {
  const factory UserLoginFormState(UserLoginEntity form) = _UserLoginFormState;
}


