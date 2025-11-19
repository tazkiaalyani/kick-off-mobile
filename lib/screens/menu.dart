import 'package:flutter/material.dart';
import 'package:kick_off/widgets/left_drawer.dart';
import 'package:kick_off/widgets/product_card.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFFDDDCDE)),
      ),
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.8,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Tazka Nur Alyani";
  final String npm = "2406496252";
  final String kelas = "F";

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.list, const Color(0xFF2E2E2E)),
    ItemHomepage("My Products", Icons.shopping_bag, const Color(0xFF5C5C5C)),
    ItemHomepage("Add Product", Icons.add_circle, const Color(0xFF0D47A1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Kick',
                style: TextStyle(color: Color(0xFF0D47A1)),
              ),
              TextSpan(
                text: ' Off',
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),
              const SizedBox(height: 32.0),

              const Text(
                'Our Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Browse the latest items from Kick Off football shop',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24.0),

              GridView.count(
                primary: false,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}