import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/value/dimension.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../services/auth_service.dart';
import '../widgets/register_header_widget.dart';
import '../widgets/register_form_widget.dart';
import '../widgets/social_button_large.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(authService: AuthService()),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

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
                    const RegisterHeaderWidget(),
                    Spacing.h(24),

                    // Social Registration Buttons
                    SocialButtonLarge(
                      iconPath: 'assets/images/search.png',
                      label: 'Continue with Google',
                      onTap: () {
                        context.read<RegisterBloc>().add(
                              const RegisterSocialSubmitted(provider: 'Google'),
                            );
                      },
                    ),
                    Spacing.h(12),
                    SocialButtonLarge(
                      iconPath: 'assets/images/facebook.png',
                      label: 'Continue with Facebook',
                      onTap: () {
                        context.read<RegisterBloc>().add(
                              const RegisterSocialSubmitted(provider: 'Facebook'),
                            );
                      },
                    ),
                    Spacing.h(24),

                    // Divider: OR SIGN UP WITH EMAIL
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade200,
                            thickness: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'OR SIGN UP WITH EMAIL',
                            style: TextStyle(
                              color: AppColors.neutral,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
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

                    // Main Registration Form
                    const RegisterFormWidget(),
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
