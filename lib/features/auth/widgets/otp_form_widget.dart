import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/value/dimension.dart';
import '../bloc/otp_bloc.dart';
import '../bloc/otp_event.dart';
import '../bloc/otp_state.dart';
import 'otp_input_widget.dart';

class OtpFormWidget extends StatefulWidget {
  final String email;

  const OtpFormWidget({super.key, required this.email});

  @override
  State<OtpFormWidget> createState() => _OtpFormWidgetState();
}

class _OtpFormWidgetState extends State<OtpFormWidget> {
  String _currentOtp = '';

  void _onVerifyPressed() {
    if (_currentOtp.length == 6) {
      context.read<OtpBloc>().add(
            OtpSubmitted(email: widget.email, otp: _currentOtp),
          );
    }
  }

  void _onResendPressed() {
    context.read<OtpBloc>().add(
          OtpResendRequested(email: widget.email),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        } else if (state is OtpSuccess) {
          Navigator.of(context).pushReplacementNamed('/dashboard');
        } else if (state is OtpResendSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP Resent!'), backgroundColor: Colors.green),
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OtpInputWidget(
              length: 6,
              onCompleted: (otp) {
                setState(() {
                  _currentOtp = otp;
                });
              },
            ),
            Spacing.h(40),
            ElevatedButton(
              onPressed: state is OtpLoading ? null : _onVerifyPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 0,
              ),
              child: state is OtpLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verify & Continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
            ),
            Spacing.h(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the code? ",
                  style: TextStyle(
                    color: AppColors.neutral,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: _onResendPressed,
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
