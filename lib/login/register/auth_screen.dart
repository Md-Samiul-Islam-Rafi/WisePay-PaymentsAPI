import 'package:flutter/material.dart';

// ১. এনাম (Enum) ব্যবহার করে ইউজারের বর্তমান স্টেট (SignIn না কি SignUp) ট্র্যাক করা হচ্ছে।
enum AuthMode { signIn, signUp }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // ২. ডিফল্টভাবে অ্যাপ ওপেন হলে 'signIn' মোডে থাকবে।
  AuthMode _authMode = AuthMode.signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // হালকা ধূসর ব্যাকগ্রাউন্ড
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // ৩. হেডার সেকশন: যেখানে লোগো এবং ওয়েলকাম টেক্সট আছে।
                _buildHeader(),
                const SizedBox(height: 30),

                // ৪. মেইন কন্টেইনার (White Card): ইনপুট ফিল্ডগুলো এই সাদা কার্ডের ভেতরে থাকবে।
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Sign in to your account or create a new one',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      const SizedBox(height: 20),

                      // ৫. টগল উইজেট: যা দিয়ে ইউজার SignIn এবং SignUp এর মধ্যে সুইচ করতে পারে।
                      _buildAuthToggle(),
                      const SizedBox(height: 20),

                      // ৬. কন্ডিশনাল রেন্ডারিং: যদি মোড 'signUp' হয়, তবেই 'Full Name' ফিল্ডটি দেখাবে।
                      if (_authMode == AuthMode.signUp) ...[
                        _buildLabel("Full Name"),
                        _buildTextField("Enter your full name"),
                        const SizedBox(height: 16),
                      ],

                      // ৭. ইমেইল ফিল্ড (এটি সব মোডেই থাকবে)।
                      _buildLabel("Email"),
                      _buildTextField("Enter your email"),
                      const SizedBox(height: 16),

                      // ৮. পাসওয়ার্ড ফিল্ড: এখানে হিন্ট টেক্সট মোডের ওপর ভিত্তি করে পরিবর্তন হচ্ছে।
                      _buildLabel("Password"),
                      _buildTextField(
                        _authMode == AuthMode.signIn
                            ? "Enter your password"
                            : "Create a password",
                        isPassword: true,
                      ),

                      // ৯. কনফার্ম পাসওয়ার্ড: শুধুমাত্র 'signUp' মোডের জন্য।
                      if (_authMode == AuthMode.signUp) ...[
                        const SizedBox(height: 16),
                        _buildLabel("Confirm Password"),
                        _buildTextField(
                          "Confirm your password",
                          isPassword: true,
                        ),
                      ],

                      const SizedBox(height: 24),

                      // ১০. সাবমিট বাটন: মোড অনুযায়ী টেক্সট চেঞ্জ হবে (Sign In / Create Account)।
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- হেল্পার মেথডস (Helper Methods) ---

  // টেক্সট ফিল্ড তৈরির কমন মেথড (Code Reusability)
  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        obscureText: isPassword,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 13, color: Color(0xFFB5B5BE)),
          filled: true,
          fillColor: const Color(0xFFF5F5F7),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          suffixIcon: isPassword
              ? const Icon(Icons.visibility_outlined, size: 18)
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 0.53, color: Color(0xFFE6E6E6)),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  // ইনপুট ফিল্ডের ওপরের ছোট লেবেল তৈরির মেথড
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }

  // কাস্টম টগল বার (Sign In | Sign Up)
  Widget _buildAuthToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _toggleItem("Sign In", AuthMode.signIn),
          _toggleItem("Sign Up", AuthMode.signUp),
        ],
      ),
    );
  }

  // টগলের সিঙ্গেল আইটেম এবং ক্লিক লজিক
  Widget _toggleItem(String title, AuthMode mode) {
    bool isActive = _authMode == mode;
    return Expanded(
      child: GestureDetector(
        onTap: () =>
            setState(() => _authMode = mode), // ক্লিক করলে স্টেট আপডেট হবে
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isActive
                ? Colors.white
                : Colors.transparent, // একটিভ মোডে সাদা রঙ
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // কালো রঙের মেইন অ্যাকশন বাটন
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // এখানে লগইন বা সাইনআপ এর লজিক বসবে
        },
        child: Text(
          _authMode == AuthMode.signIn ? "Sign In" : "Create Account",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
//------------------------------------------------------------>>>>>>>>>>>>>>>
  // অ্যাপের উপরের লোগো এবং টাইটেল অংশ
  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'W',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Welcome to WisePay',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Send money globally with the real exchange rate',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF717182), fontSize: 16),
        ),
      ],
    );
  }
}
