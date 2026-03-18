import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/ui/common_submit_button.dart';
import 'package:wisepay_paymentsapi/common/ui/drop_down_card.dart';
import 'package:wisepay_paymentsapi/common/ui/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/kyc_information/ui/identity_doc.dart';
import 'package:wisepay_paymentsapi/kyc_information/widget/step_header_card.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({super.key});

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
                  currentStep: 3,
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
                          'Address Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),

                        //text part
                        const Text(
                          'Please provide your current residential address.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF717182),
                            letterSpacing: -0.31,
                          ),
                        ),

                        const SizedBox(height: 16),

                        LabelTextfieldCard(
                          label: "Street Address",
                          hint: "123 Main Street",
                        ),
                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: LabelTextfieldCard(
                                label: "City",
                                hint: "New York",
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: LabelTextfieldCard(
                                label: "State/Province",
                                hint: "NY",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: LabelTextfieldCard(
                                label: "Postal Code",
                                hint: "10001",
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: LabelDropdownCard(
                                label: "Nationality",
                                items: ["USA", "Canada", "Bangladesh", "India"],
                                onChanged: (val) {
                                  print("Selected country: $val");
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CommonSubmitButton(
                          text: "Continue",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IdentityDoc(),
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
