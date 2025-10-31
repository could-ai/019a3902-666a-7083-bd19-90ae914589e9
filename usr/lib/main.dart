import 'package:couldai_user_app/features/paathner_auth/presentation/pages/paathner_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Paathner Web Admin',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFF0D47A1),
            scaffoldBackgroundColor: const Color(0xFF0A0A1A),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF42A5F5),
              secondary: Color(0xFF0D47A1),
              background: Color(0xFF0A0A1A),
              surface: Color(0xFF1A1A2A),
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Colors.grey[300]),
              bodyMedium: TextStyle(color: Colors.grey[400]),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0xFF1A1A2A).withOpacity(0.7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
          ),
          home: const PaathnerLoginScreen(),
        );
      },
    );
  }
}
