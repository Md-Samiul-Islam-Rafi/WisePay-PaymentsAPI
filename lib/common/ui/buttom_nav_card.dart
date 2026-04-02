import 'package:flutter/material.dart';

class ButtomNavCard extends StatefulWidget {
  const ButtomNavCard({super.key});

  @override
  State<ButtomNavCard> createState() => _ButtomNavCardState();
}

class _ButtomNavCardState extends State<ButtomNavCard> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold( bottomNavigationBar: BottomNavigationBar(
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
      ),);
  }
}
