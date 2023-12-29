
import 'package:assignment/bloc/presentation_bloc.dart';
import 'package:assignment/model/product_model.dart';
import 'package:assignment/presentation/detailed_product_detail.dart';
import 'package:assignment/refractors/home_page_refractor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<PresentationBloc>().add(FetchProducts());
    super.initState();
  }

  List<Product> productsList = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        surfaceTintColor: Colors.grey.shade200,
        toolbarHeight: 50,
        title: const Text(
          "EMART",
          style: TextStyle(fontSize: 18, letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<PresentationBloc, PresentationState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const ShimmerInHomePage();
          }
          if (state is ProductFetchedState) {
            productsList = state.products;
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: .66, crossAxisCount: 2),
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                Product product = productsList[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      )),
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Container(
                        height: screenWidth * .4,
                        // width: screenWidth * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: ClipRect(
                              child: Image.network(
                                product.image!,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          // color: Colors.teal,
                          height: (screenWidth * .4) /2,
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              productNameHomePage(product, screenWidth),
                              RatingBarIndicator(
                                rating: double.parse(
                                    product.rating!.rate.toString()),
                                itemCount: 5,
                                itemSize: 15,
                                itemBuilder: (context, index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  );
                                },
                              ),
                              productPriceHomePage(product, screenWidth),


                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
