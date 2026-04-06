import 'package:flutter/material.dart';

class MarketRates extends StatelessWidget {
  final String currencyPair; 
  final String changeValue; 
  final String rateValue; 
  final IconData icon; 
  final Color iconColor; 
  final Color backgroundColor; 

  const MarketRates({
    super.key,
    required this.currencyPair,
    required this.changeValue,
    required this.rateValue,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(width: 1, color: const Color(0x1A000000)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currencyPair,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                changeValue,
                style: const TextStyle(
                  color: Colors.grey,
                  letterSpacing: -0.15,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            rateValue,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
