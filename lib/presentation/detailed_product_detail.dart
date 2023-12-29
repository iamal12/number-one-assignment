import 'package:assignment/model/product_model.dart';
import 'package:assignment/refractors/product_detail_page_refractor.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: appBarTextDetailPage(product),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailPageImage(screenWidth, product),
              const SizedBox(height: 30),
              detailPageProductName(product),
              const SizedBox(height: 5),
              detailPageProductPrice(product),
              const SizedBox(height: 5),
              detailPageProductCategory(product),
              const SizedBox(height: 15),
              detailPageRatingBarIndicator(product),
              const SizedBox(height: 15),
              detailPageProductDescription(product),
            ],
          ),
        ),
      ),
    );
  }
}