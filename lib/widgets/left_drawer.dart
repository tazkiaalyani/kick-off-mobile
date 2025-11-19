import 'package:flutter/material.dart';
import 'package:kick_off/screens/menu.dart';
import 'package:kick_off/screens/productlist_form.dart';
import 'package:kick_off/screens/product_entry_list.dart';
import 'package:kick_off/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      backgroundColor: const Color(0xFFEFEDE8), // Background Cream
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Siku tajam seperti di web
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // === 1. HEADER LOGO ===
          Container(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
                children: [
                  TextSpan(
                    text: 'Kick',
                    style: TextStyle(color: Color(0xFF0D47A1)), // Biru Tua
                  ),
                  TextSpan(
                    text: ' Off',
                    style: TextStyle(color: Colors.black87), // Hitam/Dark Grey
                  ),
                ],
              ),
            ),
          ),

          const Divider(color: Colors.black12, height: 1),

          // === 2. MENU LIST ===
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                ListTile(
                  title: const Text('Home', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16)),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ));
                  },
                ),
                ListTile(
                  title: const Text('Product List', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Create Product', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductFormPage()),
                    );
                  },
                ),
              ],
            ),
          ),

          const Divider(color: Colors.black12, height: 1),

          // === 3. FOOTER (User Info & Logout) ===
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "kick_off",
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "2406496252 - PBP F",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () async {
                    final response = await request.logout(
                        "http://127.0.0.1:8000/auth/logout/");
                    String message = response["message"];
                    if (context.mounted) {
                      if (response['status']) {
                        String uname = response["username"];
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message See you again, $uname."),
                        ));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}