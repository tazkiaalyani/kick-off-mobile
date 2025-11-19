import 'package:flutter/material.dart';
import 'package:kick_off/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Kick Off',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0D47A1),
            primary: const Color(0xFF0D47A1),
            secondary: const Color(0xFF6FB1B2),
            surface: const Color(0xFFF5F7F8),
          ),
          scaffoldBackgroundColor: const Color(0xFFF5F7F8),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFEFEDE8),
            foregroundColor: Colors.black,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black54),
          ),
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            side: const BorderSide(
              color: Color(0xFFDDDCDE),
              width: 2.0,
            ),
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFFB0A99F);
              }
              return const Color(0xFFEEEAE3);
            }),
            checkColor: WidgetStateProperty.all(Colors.white),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFB0A99F),
            selectionColor: Color(0x4DB0A99F),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFFF2F2F0),
            contentPadding: const EdgeInsets.all(12.0),
            hintStyle: const TextStyle(color: Color(0xFFB0A99F)),
            labelStyle: const TextStyle(color: Color(0xFFB0A99F)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Color(0xFFDDDCDE), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Color(0xFFDDDCDE), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Color(0xFFB0A99F), width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}