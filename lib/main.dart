import 'package:flutter/material.dart';
import 'package:wisepay_paymentsapi/login/register/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WisePay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: false,
      ),
      home: SignIn(),
    );
  }
}
