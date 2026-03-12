import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/label_textfield_card.dart';
// remove duplicate/unused import:
// import 'package:wisepay_paymentsapi/login/register/widgets/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/login/password_reset.dart';

// ...existing code...

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _authMode = AuthMode.signIn;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...existing code...
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // ...existing code...
            child: Column(
              children: [
                // ...existing code...
                Container(
                  // ...existing code...
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ...existing code...

                      if (_authMode == AuthMode.signUp) ...[
                        LabelTextfieldCard(
                          label: "Full Name",
                          hint: "Enter your full name",
                          controller: _fullNameController, // fixed
                        ),
                        const SizedBox(height: 16),
                      ],

                      LabelTextfieldCard(
                        label: "Email",
                        hint: "enter your email",
                        controller: _emailController, // fixed
                      ),

                      const SizedBox(height: 16),

                      LabelTextfieldCard(
                        label: "Password",
                        hint: _authMode == AuthMode.signIn
                            ? "Enter your password"
                            : "Create a password",
                        isPassword: true,
                        controller: _passwordController, // fixed
                      ),

                      if (_authMode == AuthMode.signUp) ...[
                        const SizedBox(height: 16),
                        LabelTextfieldCard(
                          label: "Create a password",
                          hint: "Confirm your password",
                          isPassword: true,
                          controller: _confirmPasswordController, // fixed
                        ),
                      ],

                      // ...existing code...
                      CommonSubmitButton(
                        text: _authMode == AuthMode.signIn
                            ? "Sign In"
                            : "Create Account",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PasswordReset(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ...existing code...

