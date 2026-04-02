import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/home/ui/common/action-button.dart';
import 'package:wisepay_paymentsapi/home/ui/common/balance-card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'W',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'WisePay',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

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
            ],
          ),
        ),
      ),

      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: "Balances",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Payments"),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Cards",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
