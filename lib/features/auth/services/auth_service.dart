class AuthService {
  // Simulate network delay
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    
    // Simple mock authentication
    if (email.isNotEmpty && password.isNotEmpty) {
      return true; // Success
    }
    
    throw Exception('Invalid email or password');
  }

  Future<bool> socialLogin(String provider) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> verifyOtp(String email, String otp) async {
    await Future.delayed(const Duration(seconds: 2));
    if (otp.length == 6) {
      return true; // Success
    }
    throw Exception('Invalid OTP');
  }

  Future<bool> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool agreedToTerms,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (!agreedToTerms) {
      throw Exception('You must agree to the Terms & Privacy Policy');
    }

    if (password != confirmPassword) {
      throw Exception('Passwords do not match');
    }

    if (fullName.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      return true;
    }

    throw Exception('All fields are required');
  }
}
