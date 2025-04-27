import 'package:flutter/material.dart';
import 'package:slicing_design/utils.dart';
import 'package:slicing_design/widget/product_card_widget.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: 10,
      addRepaintBoundaries: true,
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
