

import 'package:assignment/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Text detailPageProductDescription(Product product) {
  return Text(
    product.description!.toString(),
    style: TextStyle(
        color: Colors.grey.shade800,
        letterSpacing: 1,
        fontSize: 16,
        fontWeight: FontWeight.w500),
  );
}

RatingBarIndicator detailPageRatingBarIndicator(Product product) {
  return RatingBarIndicator(
    rating: double.parse(product.rating!.rate.toString()),
    itemCount: 5,
    itemSize: 25,
    itemBuilder: (context, index) {
      return const Icon(
        Icons.star,
        color: Colors.amber,
      );
    },
  );
}

Text detailPageProductCategory(Product product) {
  return Text(
    product.category!.toString(),
    style: TextStyle(
        color: Colors.grey.shade600,
        letterSpacing: 1,
        fontSize: 15,
        fontWeight: FontWeight.w500),
  );
}

Text detailPageProductPrice(Product product) {
  return Text(
    "\$ ${product.price!.toString()}",
    style: const TextStyle(
        letterSpacing: 1, fontSize: 17, fontWeight: FontWeight.w500),
  );
}

Text detailPageProductName(Product product) {
  return Text(
    product.title!,
    style: const TextStyle(
        letterSpacing: 2, fontSize: 20, fontWeight: FontWeight.w500),
  );
}

Container detailPageImage(double screenWidth,Product product) {
  return Container(
    width: screenWidth,
    height: screenWidth * .9,
    child: Image.network(product.image!),
  );
}

Text appBarTextDetailPage(Product product) {
  return Text(
    product.category!.toUpperCase(),
    style: TextStyle(letterSpacing: 2),
  );
}
