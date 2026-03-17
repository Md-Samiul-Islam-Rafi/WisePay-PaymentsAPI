import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Map<String, String>> infoItems;

  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.infoItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.31,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 42),

            // Generate rows dynamically
            ...infoItems.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.keys.first,
                        style: const TextStyle(color: Color(0xFF717182)),
                      ),
                      Text(item.values.first),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}