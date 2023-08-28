import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medicine_tracker/bloc/auth/auth_event.dart';
import 'package:medicine_tracker/bloc/auth/auth_state.dart';
import 'package:medicine_tracker/repositories/repositories.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  late String token;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
  }

  _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    final isFormValid = event.formKey.currentState?.validate() ?? false;
    if (isFormValid) {
      emit(SignInLoading());
      try {
        final accessToken = await authRepository.signIn(event.signInData);
        await Future.delayed(const Duration(seconds: 3));
        if (accessToken.isNotEmpty) {
          const storage = FlutterSecureStorage();
          await storage.write(key: 'USER-TOKEN', value: accessToken);
          token = accessToken;

          emit(SignInSucess());
        }
      } catch (_) {
        emit(SignInFailed());
      }
    }
  }
}
