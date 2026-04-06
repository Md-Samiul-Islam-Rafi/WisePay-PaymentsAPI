import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/widget/common_submit_button.dart';
import 'package:wisepay_paymentsapi/common/widget/drop_down_card.dart';
import 'package:wisepay_paymentsapi/common/widget/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/kyc_information/ui/address_info.dart';
import 'package:wisepay_paymentsapi/kyc_information/widget/step_header_card.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                StepHeader(
                  currentStep: 2,
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
                        //personal INFO part
                        const Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),

                        //text part
                        const Text(
                          'Please provide your personal details as they appear on your ID.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF717182),
                            letterSpacing: -0.31,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: LabelTextfieldCard(label: "First Name"),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: LabelTextfieldCard(label: "Last Name"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        LabelTextfieldCard(label: "Date Of Birth"),
                        const SizedBox(height: 16),

                        LabelDropdownCard(
                          label: "Nationality",
                          items: ["USA", "Canada", "Bangladesh", "India"],
                          onChanged: (val) {
                            print("Selected country: $val");
                          },
                        ),
                        const SizedBox(height: 16),

                        LabelTextfieldCard(
                          label: "Phone Number",
                          hint: "+1 (555) 123-4567",
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),

                        LabelTextfieldCard(
                          label: "Occupation",
                          hint: "Software Engineer",
                        ),
                        const SizedBox(height: 24),

                        CommonSubmitButton(
                          text: "Continue",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddressInfo(),
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
