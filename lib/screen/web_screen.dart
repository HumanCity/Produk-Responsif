import 'package:flutter/material.dart';
import 'package:slicing_design/utils.dart';
import 'package:slicing_design/widget/product_card_widget.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Untuk Web atau tablet, kita bisa menampilkan Grid dengan lebih banyak kolom
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Lebih banyak kolom di web atau tablet
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 10,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ProductCard(
          imageUrl:
              'https://cf.shopee.co.id/file/f68b812de2391a12074d7c316833599a',
          name: 'Pota Bee',
          price: '\$${generateRandomPrice().toString()}',
        );
      },
    );
  }
}
