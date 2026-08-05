import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool agreedToTerms;

  const RegisterSubmitted({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.agreedToTerms,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        password,
        confirmPassword,
        agreedToTerms,
      ];
}

class RegisterSocialSubmitted extends RegisterEvent {
  final String provider;

  const RegisterSocialSubmitted({required this.provider});

  @override
  List<Object?> get props => [provider];
}
