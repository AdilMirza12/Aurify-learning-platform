import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/value/dimension.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../services/auth_service.dart';
import '../widgets/login_header_widget.dart';
import '../widgets/login_form_widget.dart';
import '../widgets/social_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authService: AuthService()),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Back button
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: IconButton(
                    //     icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                    //     onPressed: () {
                    //       if (Navigator.canPop(context)) {
                    //         Navigator.pop(context);
                    //       }
                    //     },
                    //   ),
                    // ),
                    const LoginHeaderWidget(),
                    Spacing.h(40),
                    const LoginFormWidget(),
                    Spacing.h(32),
                    // Or continue with
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                              color: AppColors.neutral,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    Spacing.h(24),
                    // Social Login Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLoginButton(
                          assetPath: 'assets/images/search.png',
                          onTap: () {
                            context.read<LoginBloc>().add(
                              const LoginSocialSubmitted(provider: 'Google'),
                            );
                          },
                        ),
                        Spacing.w(20),
                        SocialLoginButton(
                          assetPath: 'assets/images/facebook.png',
                          onTap: () {
                            context.read<LoginBloc>().add(
                              const LoginSocialSubmitted(provider: 'Facebook'),
                            );
                          },
                        ),
                        Spacing.w(20),
                        SocialLoginButton(
                          assetPath: 'assets/images/apple.png',
                          onTap: () {
                            context.read<LoginBloc>().add(
                              const LoginSocialSubmitted(provider: 'Apple'),
                            );
                          },
                        ),
                      ],
                    ),
                    Spacing.h(40),
                    // Sign Up Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: AppColors.neutral,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/register');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
