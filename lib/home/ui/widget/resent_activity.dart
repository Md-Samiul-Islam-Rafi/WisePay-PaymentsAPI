import 'package:flutter/material.dart';

class ResentActivity extends StatelessWidget {
  final String title; // যেমন: "Transfer to John Smith"
  final String status; // যেমন: "Completed"
  final String date; // যেমন: "1/2/2025"
  final String amount; // যেমন: "\$150.00"
  final String currency; // যেমন: "USD"
  final IconData leadingIcon; // যেমন: Icons.send
  final Color leadingColor; // যেমন: Colors.red
  final IconData statusIcon; // যেমন: Icons.check_circle_outline
  final Color statusColor; // যেমন: Colors.green

  const ResentActivity({
    super.key,
    required this.title,
    required this.status,
    required this.date,
    required this.amount,
    required this.currency,
    required this.leadingIcon,
    required this.leadingColor,
    required this.statusIcon,
    required this.statusColor,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(leadingIcon, size: 18, color: leadingColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.31,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(statusIcon, size: 16, color: statusColor),
                    const SizedBox(width: 8),
                    Text(
                      '$status • $date',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(currency, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
