abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoadingGoogle extends AuthState {}

class LoginSuccess extends AuthState {}

class SignupSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure({required this.errMessage});
}
