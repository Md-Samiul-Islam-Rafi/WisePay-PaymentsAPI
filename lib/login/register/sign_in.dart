import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          SizedBox(height: 200),

          //logo part
          Center(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  'W',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 14),

          //logo Text part
          Text(
            'Welcome to WisePay',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),

          SizedBox(height: 4),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              'Send money globally with the real exchange rate',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.31,
                color: Color(0xFF717182),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),

          //Sign part
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: (Color(0xFFFFFFFF)),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(134, 230, 226, 226),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.45,
                      ),
                    ),
                    SizedBox(height: 16),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Sign in to your account or create a new one',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF717182),
                          letterSpacing: -0.31,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
