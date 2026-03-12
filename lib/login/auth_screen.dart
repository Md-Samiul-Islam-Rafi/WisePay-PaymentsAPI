import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/login/password_reset.dart';

/// Enumeration used to track whether the user is signing in or signing up.
enum AuthMode { signIn, signUp }

/// The initial authentication screen shown when the app starts.  It allows
/// toggling between sign-in and sign-up mode and collects the required fields.
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

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

  void _switchMode(AuthMode mode) {
    setState(() {
      _authMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Text(
                  'Welcome to WisePay',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // Mode selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => _switchMode(AuthMode.signIn),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: _authMode == AuthMode.signIn
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _authMode == AuthMode.signIn
                              ? Colors.deepOrange
                              : Colors.black54,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _switchMode(AuthMode.signUp),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: _authMode == AuthMode.signUp
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _authMode == AuthMode.signUp
                              ? Colors.deepOrange
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        width: 0.53, color: const Color(0x1A000000)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_authMode == AuthMode.signUp) ...[
                        LabelTextfieldCard(
                          label: "Full Name",
                          hint: "Enter your full name",
                          controller: _fullNameController,
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
                      const SizedBox(height: 24),
                      CommonSubmitButton(
                        text: _authMode == AuthMode.signIn
                            ? "Sign In"
                            : "Create Account",
                        onPressed: () {
                          if (_authMode == AuthMode.signIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PasswordReset(),
                              ),
                            );
                          } else {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text;
                            final confirm = _confirmPasswordController.text;
                            if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please fill all fields")),
                              );
                            } else if (password != confirm) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Passwords do not match")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Account created")),
                              );
                            }
                          }
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
}

