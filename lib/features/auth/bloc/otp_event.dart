import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class OtpSubmitted extends OtpEvent {
  final String email;
  final String otp;

  const OtpSubmitted({required this.email, required this.otp});

  @override
  List<Object?> get props => [email, otp];
}

class OtpResendRequested extends OtpEvent {
  final String email;

  const OtpResendRequested({required this.email});

  @override
  List<Object?> get props => [email];
}
