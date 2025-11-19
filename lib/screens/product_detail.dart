import 'package:flutter/material.dart';
import 'package:kick_off/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.thumbnail.isNotEmpty)
              Image.network(
                'http://127.0.0.1:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 300,
                  color: const Color(0xFFF2F2F0),
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50, color: Color(0xFFB0A99F)),
                  ),
                ),
              ),

            Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                border: Border(
                  top: BorderSide(color: Color(0xFFDDDCDE), width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (product.isFeatured)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB0A99F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: const Text(
                              'Best Seller',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFDDDCDE)),
                            borderRadius: BorderRadius.circular(6.0),
                            color: const Color(0xFFF2F2F0),
                          ),
                          child: Text(
                            product.category,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB0A99F),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "Rp ${product.price}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB0A99F),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Color(0xFFB0A99F)),
                        const SizedBox(width: 4),
                        Text(
                          'Listed on ${_formatDate(product.createdAt)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFB0A99F),
                          ),
                        ),
                      ],
                    ),

                    const Divider(height: 32, color: Color(0xFFDDDCDE)),

                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 16.0,
                        height: 1.6,
                        color: Color(0xFFB0A99F),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}