import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/widget/common_submit_button.dart';
import 'package:wisepay_paymentsapi/common/widget/drop_down_card.dart';
import 'package:wisepay_paymentsapi/common/widget/label_textfield_card.dart';
import 'package:wisepay_paymentsapi/kyc_information/ui/take_selfie.dart';
import 'package:wisepay_paymentsapi/kyc_information/widget/step_header_card.dart';

class FileUploadCard extends StatelessWidget {
  final String label;
  final FileType fileType;
  final List<String>? extensions;

  const FileUploadCard({
    Key? key,
    required this.label,
    required this.fileType,
    this.extensions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: fileType,
          allowedExtensions: extensions,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x1A000000), width: 0.53),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label),
      ),
    );
  }
}

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
                          hintText: "Select document type",
                          items: ["D102", "E243", "R232", "U343"],
                          onChanged: (val) {
                            print("Selected document type: $val");
                          },
                          label: 'Document Type',
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

                        SizedBox(height: 16),

                        Text(
                          "Fount of Documnet",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 8),
                        // PDF upload card
                        FileUploadCard(
                          label: "Upload your document",
                          fileType: FileType.custom,
                          extensions: ['pdf'],
                        ),

                        // PDF upload card
                        const SizedBox(height: 16),
                        CommonSubmitButton(
                          text: "Continue",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TakeSelfie(),
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
