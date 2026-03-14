import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/login/create_new_password.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/login/register/common_widgets/step_dot.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
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
                  border: Border.all(
                    width: 0.53,
                    color: const Color(0x1A000000),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      //container for icon button
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
                        'Enter Reset Code',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),

                      //text part
                      const Text(
                        'We ve sent a 6-digit code to syedsherazofficial@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF717182),
                          letterSpacing: -0.31,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 24),

                      //text field
                      LabelTextfieldCard(
                        label: "Reset Code",
                        hint: "Enter 6-digit code",
                      ),

                      SizedBox(height: 16),

                      Text(
                        'Didnt receive the code',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF717182),
                          letterSpacing: -0.15,
                        ),
                      ),

                      SizedBox(height: 8),

                      //Text resend code
                      Text(
                        'Resend Code',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 16),

                      //Submit Button
                      CommonSubmitButton(
                        text: "Verify Code",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewPassword(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              StepDots(currentStep: 2),
            ],
          ),
        ),
      ),
    );
  }
}
