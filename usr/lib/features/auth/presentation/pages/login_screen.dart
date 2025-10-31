import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_animations/simple_animations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(),
                SizedBox(height: 5.h),
                _buildLoginForm(),
                SizedBox(height: 3.h),
                _buildForgotPassword(),
                SizedBox(height: 5.h),
                _buildLoginButton(),
                SizedBox(height: 3.h),
                _buildSignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "Login to your account",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        _buildAnimatedTextField(
          delay: 600,
          icon: Icons.email,
          hintText: "Email",
        ),
        SizedBox(height: 2.h),
        _buildAnimatedTextField(
          delay: 700,
          icon: Icons.lock,
          hintText: "Password",
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildAnimatedTextField({
    required int delay,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500),
      delay: Duration(milliseconds: delay),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: child,
          ),
        );
      },
      child: _buildTextField(icon, hintText, obscureText),
    );
  }

  Widget _buildTextField(IconData icon, String hintText, bool obscureText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 900),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: TextStyle(color: Colors.white70),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
