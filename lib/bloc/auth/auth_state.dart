class AuthState {
  AuthState();
}

class AuthInitial extends AuthState {}

class SignInSucess extends AuthState {
  SignInSucess() : super();
}

class SignInFailed extends AuthState {
  SignInFailed() : super();
}

class SignInLoading extends AuthState {
  SignInLoading() : super();
}
