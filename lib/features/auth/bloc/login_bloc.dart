import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;

  LoginBloc({required AuthService authService})
      : _authService = authService,
        super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginSocialSubmitted>(_onLoginSocialSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final success = await _authService.login(event.email, event.password);
      if (success) {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure(error: 'Login failed'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> _onLoginSocialSubmitted(
    LoginSocialSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final success = await _authService.socialLogin(event.provider);
      if (success) {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure(error: 'Social login failed'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
