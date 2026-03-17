import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/kyc_information/widget/info_card.dart';
import 'package:wisepay_paymentsapi/kyc_information/widget/step_header_card.dart';

class ReviewInfo extends StatelessWidget {
  const ReviewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              StepHeader(
                currentStep: 6,
                totalSteps: 6,
                onBack: () => Navigator.pop(context),
              ),
              //review Information
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
                        'Review Your Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      //text part
                      const Text(
                        'Please review all the information before submitting your KYC application.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF717182),
                          letterSpacing: -0.31,
                        ),
                      ),

                      const SizedBox(height: 24),

                      //personal Information
                      InfoCard(
                        title: "personal Information",
                        icon: Icons.person_2_outlined,
                        infoItems: [
                          {"Name:": "Samiul Islam"},
                          {"Date of Birth:": "03-02-2005"},
                          {"Nationality:": "BD"},
                          {"Phone:": "017.."},
                          {"Occupation:": "Student"},
                        ],
                      ),

                      const SizedBox(height: 16),

                      //Address
                      InfoCard(
                        title: "Address",
                        icon: Icons.location_on_outlined,
                        infoItems: [
                          {"Street:": "1"},
                          {"City:": "1,1"},
                          {"Postal Code:": "1"},
                          {"Country:": "US"},
                        ],
                      ),
                      const SizedBox(height: 16),

                      //Documents
                      InfoCard(
                        title: "Documents",
                        icon: Icons.folder_open,
                        infoItems: [
                          {"Document Type": "Passport"},
                          {"Document Number:": "344839"},
                          {"Expiry Date:": "2026-09-30"},
                          {"Document:": "Front"},
                          {"Country:": "Uploaded"},
                        ],
                      ),

                      const SizedBox(height: 24),

                      //Review Processing
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 229, 237, 243),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.error_outline_sharp, size: 14),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'Review Processing',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                      255,
                                      3,
                                      42,
                                      168,
                                    ),
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  "Your KYC application will be reviewed within 1-2 business days. You'll receive an email notification once the review is complete.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                      255,
                                      3,
                                      42,
                                      168,
                                    ),
                                    letterSpacing: -0.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 82),
                    ],
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
