import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/home/ui/widget/action-button.dart';
import 'package:wisepay_paymentsapi/common/widget/balance-card.dart';
import 'package:wisepay_paymentsapi/home/ui/widget/market_rates.dart';
import 'package:wisepay_paymentsapi/home/ui/widget/resent_activity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0x33FBD8BC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 0.53,
                    color: const Color(0xFFA25900),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.warning_amber_rounded),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Verification in progress',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA25900),
                              ),
                            ),
                            Text(
                              'Complete your verification to unlock all features',
                              style: TextStyle(
                                color: Color(0xFFC06D00),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            221,
                            215,
                            215,
                          ),
                        ),
                        onPressed: () {
                          // verification flow
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // part of Good morning, syedsherazofficial
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning, Samiul Islam',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          "Here's your financial overview",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.nightlight_outlined, size: 24),
                ],
              ),

              const SizedBox(height: 24),

              // Total amaount part
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.black54],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //text Total balance
                            Text(
                              'Total Balance',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),

                            // amount
                            Text(
                              '\$2862.96',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(height: 16),

                            //icon for trending
                            Row(
                              children: [
                                Icon(Icons.trending_up, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  '+2.4% from last month',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.trending_up,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Balances',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
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
                "Quick Actions",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12),

              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ActionCard(
                          icon: Icons.send,
                          iconColor: Colors.black,
                          label: "Send Money",
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: ActionCard(
                          icon: Icons.qr_code,
                          iconColor: Colors.blue,
                          label: "Request Money",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ActionCard(
                          icon: Icons.arrow_downward,
                          iconColor: Colors.green,
                          label: "Add Money",
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: ActionCard(
                          icon: Icons.currency_exchange_sharp,
                          iconColor: Colors.orange,
                          label: "Convert Currency",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 1, color: Color(0x1A000000)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        size: 28,
                        color: Colors.purpleAccent,
                      ),

                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Card",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Get a physical or virtual card",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 28),

              //Market Rate part
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Market Rates',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              SizedBox(height: 12),

              //marketRate widget
              MarketRates(
                currencyPair: "USD/EUR",
                changeValue: '-0.0023',
                rateValue: '0.8542',
                icon: Icons.trending_down,
                iconColor: Colors.red,
                backgroundColor: Colors.red[50]!,
              ),
              SizedBox(height: 8),
              MarketRates(
                currencyPair: "GBP/USD",
                changeValue: '+0.0087',
                rateValue: '1.2456',
                icon: Icons.trending_up,
                iconColor: Colors.green,
                backgroundColor: Colors.green[50]!,
              ),
              SizedBox(height: 8),
              MarketRates(
                currencyPair: "EUR/USD",
                changeValue: '+0.0012',
                rateValue: '0.8734',
                icon: Icons.trending_up,
                iconColor: Colors.green,
                backgroundColor: Colors.green[50]!,
              ),

              SizedBox(height: 24),

              // Recent Activity part
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              SizedBox(height: 12),

              //resent activity
              ResentActivity(
                title: 'Transfer to John Smith',
                status: 'Completed',
                date: '1/2/2025',
                amount: '\$150.00',
                currency: 'USD',
                leadingIcon: Icons.send,
                leadingColor: Colors.red,
                statusIcon: Icons.check_circle_outline,
                statusColor: Colors.green,
              ),
              SizedBox(height: 8),
              ResentActivity(
                title: 'Payment from Sarah Johnson',
                status: 'Pending',
                date: '1/2/2025',
                amount: '\$890.22',
                currency: 'USD',
                leadingIcon: Icons.file_download_outlined,
                leadingColor: Colors.red,
                statusIcon: Icons.access_time,
                statusColor: Colors.orange,
              ),
              SizedBox(height: 8),
              ResentActivity(
                title: 'Converted GBP to USD',
                status: 'Completed',
                date: '1/6/2025',
                amount: '\$200.00',
                currency: 'USD',
                leadingIcon: Icons.refresh,
                leadingColor: Colors.blue,
                statusIcon: Icons.check_circle_outline,
                statusColor: Colors.green,
              ),
              SizedBox(height: 8),
              ResentActivity(
                title: 'Transfer to John Smith',
                status: 'Completed',
                date: '1/8/2025',
                amount: '\$190.00',
                currency: 'USD',
                leadingIcon: Icons.file_download_outlined,
                leadingColor: Colors.red,
                statusIcon: Icons.check_circle_outline,
                statusColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
