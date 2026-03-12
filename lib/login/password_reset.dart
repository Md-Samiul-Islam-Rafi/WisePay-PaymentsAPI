import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/step_dot.dart';
import 'package:wisepay_paymentsapi/login/verifycodepage.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 160),
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8),
                  Text(
                    'Back to sign In',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 0.53, color: const Color(0x1A000000)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 14),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.email),
                      ),
                      const SizedBox(height: 22),
                      const Text(
                        'Reset Your Password',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Enter your email address and we’ll send you a reset code',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF717182),
                          letterSpacing: -0.31,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      LabelTextfieldCard(
                        label: "Email address",
                        hint: "Enter your email",
                        controller: _emailController, // fixed
                      ),

                      const SizedBox(height: 16),
                      CommonSubmitButton(
                        text: "Send Reset Code",
                        onPressed: () {
                          final email = _emailController.text.trim();
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

                          if (emailRegex.hasMatch(email)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VerifyCodePage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter a valid email"),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const StepDots(currentStep: 1),
            ],
          ),
        ),
      ),
    );
  }
}