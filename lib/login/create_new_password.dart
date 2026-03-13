import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/login/password_reset_successfull.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/step_dot.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 160),

              //back button part

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
                  border: Border.all(
                    width: 0.53,
                    color: const Color(0x1A000000),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),

                        child: Icon(Icons.security),
                      ),

                      SizedBox(height: 16),

                      //text Enter reset code
                      const Text(
                        'Create New Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),

                      //text part
                      const Text(
                        'Choose a strong password for your account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF717182),
                          letterSpacing: -0.31,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      //Input text field

                      SizedBox(height: 24),
                      LabelTextfieldCard(
                        label: "New Password",
                        hint: "Enter new Passwoed",
                      ),
                      SizedBox(height: 16),
                      LabelTextfieldCard(
                        label: "Confirm Password",
                        hint: "Confirm new password",
                      ),
                      SizedBox(height: 16),

                      //Password requirement part

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECECF0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Password requirements:",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF717182),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "At least 8 characters long",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF717182),
                              ),
                            ),
                            Text(
                              "Mix of letters, numbers, and symbols",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF717182),
                              ),
                            ),
                            Text(
                              "Not easily guessable",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF717182),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),

                      CommonSubmitButton(
                        text: "Reset Password",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordResetSuccessfull(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              StepDots(currentStep: 3),
            ],
          ),
        ),
      ),
    );
  }
}
