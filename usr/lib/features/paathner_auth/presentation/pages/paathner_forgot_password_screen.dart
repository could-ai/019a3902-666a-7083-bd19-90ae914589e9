import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:couldai_user_app/features/paathner_auth/presentation/widgets/animated_grid_background.dart';
import 'package:couldai_user_app/features/paathner_auth/presentation/widgets/glowing_button.dart';

class PaathnerForgotPasswordScreen extends StatelessWidget {
  const PaathnerForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedGridBackground()),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 40),
                    _buildResetForm(),
                    const SizedBox(height: 40),
                    _buildFooter(context),
                  ],
                ),
              ),
            ),
          ),
        ],
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
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          Icon(
            Icons.vpn_key_off_outlined,
            size: 60,
            color: Colors.blue.shade300,
          ),
          const SizedBox(height: 20),
          const Text(
            "Forgot Your Password?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "No problem. Enter your email below and we'll send you a link to reset it.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetForm() {
     return PlayAnimationBuilder<double>(
       tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Enter your email",
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 24),
          GlowingButton(
            text: "Send Reset Link",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return const Text(
      "@Paathner 2024",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey),
    );
  }
}
