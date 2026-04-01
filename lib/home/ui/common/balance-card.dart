import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final String currencyCode;
  final String statusText;
  final String amount;
  final String flagAsset;

  const BalanceCard({
    Key? key,
    required this.currencyCode,
    required this.statusText,
    required this.amount,
    required this.flagAsset,
  }) : super(key: key);

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
          Image.asset(
            flagAsset,
            width: 32,
            height: 24,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currencyCode,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                statusText,
                style: const TextStyle(
                  color: Colors.grey,
                  letterSpacing: -0.15,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}