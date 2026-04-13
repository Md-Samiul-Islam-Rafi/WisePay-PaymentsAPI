import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/common/widget/balance-card.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Banlace ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 4),

              Text(
                'Manage your multi-currency accounts',
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 24),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search currencies..",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    print("Searching : $value");
                  },
                ),
              ),

              SizedBox(height: 24),

              Text(
                'Active Balances',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12),

              BalanceCard(
                currencyCode: "USD",
                statusText: "Available",
                amount: "\$1250.43",
                flagAsset: "assets/images/usd-flag.png",
              ),

              SizedBox(height: 12),

              BalanceCard(
                currencyCode: "EUR",
                statusText: "Available",
                amount: "\$8900.22",
                flagAsset: "assets/images/eur-flag.png",
              ),

              SizedBox(height: 12),

              BalanceCard(
                currencyCode: "GBP",
                statusText: "Available",
                amount: "\$456.78",
                flagAsset: "assets/images/jbp-flag.avif",
              ),

              SizedBox(height: 24),

              Text(
                'Available Currenciesss',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.31,
                ),
              ),

              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
