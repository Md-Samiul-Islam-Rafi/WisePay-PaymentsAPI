import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/home/ui/home_screen.dart';
import 'package:wisepay_paymentsapi/kyc_information/ui/verify_identity.dart';
import 'package:wisepay_paymentsapi/common/ui/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/login/password_reset.dart';

enum AuthMode { signIn, signUp }

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _authMode = AuthMode.signIn;

  void _switchMode(AuthMode mode) {
    setState(() {
      _authMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: 56,
                width: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF0B0B2B),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Center(
                    child: Text(
                      "W",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              Text(
                "Welcome to WisePay",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text(
                "Send money globally with the real exchange rate",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 32),

              /// MAIN CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 0.5,
                    color: const Color(0x33000000),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get started",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Sign in to your account or create a new one",
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),

                    const SizedBox(height: 16),

                    /// SIGN IN / SIGN UP TOGGLE
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          /// SIGN IN
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _switchMode(AuthMode.signIn),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _authMode == AuthMode.signIn
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// SIGN UP
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _switchMode(AuthMode.signUp),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _authMode == AuthMode.signUp
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// create account from part
                    if (_authMode == AuthMode.signUp) ...[
                      const LabelTextfieldCard(
                        label: "Full Name",
                        hint: "Enter your full name",
                      ),
                      const SizedBox(height: 16),
                    ],

                    const LabelTextfieldCard(
                      label: "Email",
                      hint: "Enter your email",
                    ),

                    const SizedBox(height: 16),

                    LabelTextfieldCard(
                      label: "Password",
                      hint: _authMode == AuthMode.signIn
                          ? "Enter your password"
                          : "Create a password",
                      isPassword: true,
                    ),

                    if (_authMode == AuthMode.signUp) ...[
                      const SizedBox(height: 16),

                      const LabelTextfieldCard(
                        label: "Confirm Password",
                        hint: "Confirm your password",
                        isPassword: true,
                      ),
                    ],

                    const SizedBox(height: 24),

                    //button part
                    CommonSubmitButton(
                      text: _authMode == AuthMode.signIn
                          ? "Sign In"
                          : "Create Account",
                      onPressed: () {
                        if (_authMode == AuthMode.signIn) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerifyIdentity(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordReset()),
                  );
                },
                child: const Text(
                  'Forget Your Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.42,
                    color: Colors.brown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
