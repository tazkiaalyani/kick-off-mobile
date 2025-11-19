import 'package:flutter/material.dart';
import 'package:kick_off/models/product_entry.dart';
import 'package:kick_off/widgets/left_drawer.dart';
import 'package:kick_off/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:kick_off/screens/product_detail.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFB0A99F)));
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'No products available in Kick Off.',
                    style: TextStyle(fontSize: 20, color: Color(0xFF2C3E50)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}