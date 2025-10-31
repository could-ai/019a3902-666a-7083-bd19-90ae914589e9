import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:couldai_user_app/features/paathner_auth/presentation/pages/paathner_forgot_password_screen.dart';
import 'package:couldai_user_app/features/paathner_auth/presentation/widgets/animated_grid_background.dart';
import 'package:couldai_user_app/features/paathner_auth/presentation/widgets/glowing_button.dart';
import 'package:couldai_user_app/features/paathner_auth/presentation/widgets/social_login_button.dart';

class PaathnerLoginScreen extends StatelessWidget {
  const PaathnerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedGridBackground()),
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
                    _buildLoginForm(context),
                    const SizedBox(height: 20),
                    _buildSocialLogins(),
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
      child: const Text(
        "Welcome to Paathner",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
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
            decoration: InputDecoration(
              hintText: "Email / Username",
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (val) {}, visualDensity: VisualDensity.compact),
                  const Text("Remember Me"),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const PaathnerForgotPasswordScreen(),
                  ));
                },
                child: const Text("Forgot Password?"),
              ),
            ],
          ),
          const SizedBox(height: 24),
          GlowingButton(
            text: "Login",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLogins() {
    return PlayAnimationBuilder<double>(
       tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 400),
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
          const Row(
            children: [
              Expanded(child: Divider(thickness: 0.5)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("OR CONTINUE WITH"),
              ),
              Expanded(child: Divider(thickness: 0.5)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SocialLoginButton(
                  text: "Google",
                  icon: Icons.g_mobiledata, // Placeholder
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SocialLoginButton(
                  text: "Microsoft",
                  icon: Icons.window, // Placeholder
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: "Terms & Conditions",
                style: const TextStyle(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              const TextSpan(text: "  •  "),
              TextSpan(
                text: "Privacy Policy",
                style: const TextStyle(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "@Paathner 2024",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
