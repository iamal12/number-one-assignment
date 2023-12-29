import 'dart:async';
import 'dart:convert';

import 'package:assignment/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'presentation_event.dart';
part 'presentation_state.dart';

class PresentationBloc extends Bloc<PresentationEvent, PresentationState> {
  PresentationBloc() : super(PresentationInitial()) {
    on<FetchProducts>(_fetchProducts);
  }

  List<Product> productsList = [];

  FutureOr<void> _fetchProducts(
      FetchProducts event, Emitter<PresentationState> emit) async {
    try {
      emit(LoadingState());
      final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        productsList.clear();
        for (Map<String, dynamic> i in jsonData) {
          productsList.add(Product.fromJson(i));
        }
        // debugPrint(productsList.toString());
        emit(ProductFetchedState(products: productsList));
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
