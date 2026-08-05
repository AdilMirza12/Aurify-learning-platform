import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService _authService;

  RegisterBloc({required AuthService authService})
      : _authService = authService,
        super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<RegisterSocialSubmitted>(_onRegisterSocialSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final success = await _authService.register(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
        agreedToTerms: event.agreedToTerms,
      );
      if (success) {
        emit(RegisterSuccess(email: event.email));
      } else {
        emit(const RegisterFailure(error: 'Registration failed'));
      }
    } catch (e) {
      emit(RegisterFailure(error: e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> _onRegisterSocialSubmitted(
    RegisterSocialSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final success = await _authService.socialLogin(event.provider);
      if (success) {
        emit(const RegisterSuccess(email: 'user@example.com'));
      } else {
        emit(const RegisterFailure(error: 'Social registration failed'));
      }
    } catch (e) {
      emit(RegisterFailure(error: e.toString().replaceAll('Exception: ', '')));
    }
  }
}
