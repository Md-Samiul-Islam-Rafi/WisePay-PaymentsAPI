import 'package:flutter/material.dart';

class StepHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onBack;

  const StepHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = currentStep / totalSteps;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: onBack,
                  ),
                  const Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.15,
                    ),
                  ),
                ],
              ),
              Text(
                "Step $currentStep of $totalSteps",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF717182),
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.grey[300],
            color: Colors.black,
            minHeight: 8,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
