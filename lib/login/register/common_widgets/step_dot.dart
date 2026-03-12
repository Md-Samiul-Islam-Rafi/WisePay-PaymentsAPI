import 'package:flutter/material.dart';

class StepDots extends StatelessWidget {
  final int currentStep; 
  final int totalSteps;  

  const StepDots({
    super.key,
    required this.currentStep,
    this.totalSteps = 3, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        bool isActive = index < currentStep;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}