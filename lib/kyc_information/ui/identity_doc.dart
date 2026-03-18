import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/common/ui/drop_down_card.dart';
import 'package:wisepay_paymentsapi/common/ui/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/kyc_information/ui/review_info.dart';
import 'package:wisepay_paymentsapi/kyc_information/ui/verify_identity.dart';
import 'package:wisepay_paymentsapi/kyc_information/widget/step_header_card.dart';

class IdentityDoc extends StatelessWidget {
  const IdentityDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StepHeader(
                  currentStep: 4,
                  totalSteps: 6,
                  onBack: () => Navigator.pop(context),
                ),

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Identity Documents',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),

                        //text part
                        const Text(
                          'Upload a clear photo of your goverment - issued ID',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF717182),
                            letterSpacing: -0.31,
                          ),
                        ),

                        const SizedBox(height: 16),

                        LabelDropdownCard(
                          label: "Document Type",
                          items: ["D102", "E243", "R232", "U343"],
                          onChanged: (val) {
                            print("Selected document type: $val");
                          },
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: LabelTextfieldCard(
                                label: "Document Number",
                                hint: "A1234567",
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: LabelTextfieldCard(
                                label: "Expiry Date",
                                hint: "NY",
                              ),
                            ),
                          ],
                        ),
                        Text("Fount of Documnet"),

                        const SizedBox(height: 16),
                        CommonSubmitButton(
                          text: "Continue",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReviewInfo(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
