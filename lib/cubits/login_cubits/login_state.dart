import 'package:equatable/equatable.dart';

class MainLoginState extends Equatable {
  const MainLoginState();

  @override
  List<Object?> get props => [];
}

abstract class LoginState extends Equatable {
  final MainLoginState loginState;

  const LoginState(this.loginState);

  @override
  List<Object?> get props => [loginState];
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(const MainLoginState());
}

class LoginLoading extends LoginState {
  const LoginLoading(super.loginState);
}

class LoginLoaded extends LoginState {
  const LoginLoaded(super.loginState);
}

class LoginEmptyUsernamePassword extends LoginState {
  const LoginEmptyUsernamePassword(super.loginState);
}

class LoginInvalidData extends LoginState {
  const LoginInvalidData(super.loginState);
}

class LoginError extends LoginState {
  final String error;

  const LoginError(super.loginState, this.error);

  @override
  List<Object?> get props => [loginState, error];
}

class LoginSuccess extends LoginState {
  const LoginSuccess(super.loginState);
}

class LoginLogout extends LoginState {
  const LoginLogout(super.loginState);
}
