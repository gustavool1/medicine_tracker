class AuthState {
  AuthState();
}

class AuthInitial extends AuthState {}

class AuthSignInSuccess extends AuthState {
  AuthSignInSuccess() : super();
}

class AuthSignInFailed extends AuthState {
  AuthSignInFailed() : super();
}

class AuthSignInLoading extends AuthState {
  AuthSignInLoading() : super();
}

class AuthRegisterSuccess extends AuthState {
  AuthRegisterSuccess() : super();
}

class AuthRegisterFailed extends AuthState {
  AuthRegisterFailed() : super();
}

class AuthRegisterLoading extends AuthState {
  AuthRegisterLoading() : super();
}
