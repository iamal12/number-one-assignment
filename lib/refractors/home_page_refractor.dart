import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../model/product_model.dart';

class ShimmerInHomePage extends StatelessWidget {
  const ShimmerInHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: .75,
          crossAxisCount: 2),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const ShimmerWidget(height: 10, width: 150),
                const SizedBox(height: 10),
                const ShimmerWidget(height: 10, width: 150),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
      ),
    );
  }
}

Text productPriceHomePage(Product product, double screenWidth) {
  return Text("\$ ${product.price.toString()}",
      style: TextStyle(
          fontSize: screenWidth * .033,
          fontWeight: FontWeight.w500));
}

Text productNameHomePage(Product product, double screenWidth) {
  return Text(product.title!,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          letterSpacing: .5,
          fontSize: screenWidth * .035,
          fontWeight: FontWeight.w600));
}