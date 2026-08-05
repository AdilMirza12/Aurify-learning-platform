import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthService _authService;

  OtpBloc({required AuthService authService})
      : _authService = authService,
        super(OtpInitial()) {
    on<OtpSubmitted>(_onOtpSubmitted);
    on<OtpResendRequested>(_onOtpResendRequested);
  }

  Future<void> _onOtpSubmitted(
    OtpSubmitted event,
    Emitter<OtpState> emit,
  ) async {
    emit(OtpLoading());
    try {
      final success = await _authService.verifyOtp(event.email, event.otp);
      if (success) {
        emit(OtpSuccess());
      } else {
        emit(const OtpFailure(error: 'Invalid OTP'));
      }
    } catch (e) {
      emit(OtpFailure(error: e.toString()));
    }
  }

  Future<void> _onOtpResendRequested(
    OtpResendRequested event,
    Emitter<OtpState> emit,
  ) async {
    // In a real app, you would call a service method to resend the OTP
    await Future.delayed(const Duration(seconds: 1));
    emit(OtpResendSuccess());
  }
}
