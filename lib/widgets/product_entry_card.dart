import 'package:flutter/material.dart';
import 'package:kick_off/models/product_entry.dart';

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;
  final VoidCallback onTap;

  const ProductEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(color: Color(0xFFBFD8D2), width: 1),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'http://127.0.0.1:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E4057),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Rp ${product.price}",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE2978A),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7F8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Category: ${product.category}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6FB1B2),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description.length > 100
                      ? '${product.description.substring(0, 100)}...'
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF2E4057),
                  ),
                ),
                const SizedBox(height: 8),
                if (product.isFeatured)
                  Row(
                    children: const [
                      Icon(Icons.star, color: Color(0xFFE2978A), size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Best Seller',
                        style: TextStyle(
                          color: Color(0xFFE2978A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}