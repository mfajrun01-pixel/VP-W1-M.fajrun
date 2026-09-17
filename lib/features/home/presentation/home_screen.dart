import 'package:flutter/material.dart';
import '../../../core/widgets/price_tag.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warung Digital'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            PriceTag(label: 'Nasi Goreng', price: 15000),
            PriceTag(label: 'Es Teh Manis', price: 5000),
            PriceTag(label: 'Ayam Goreng', price: 18000),
          ],
        ),
      ),
    );
  }
}