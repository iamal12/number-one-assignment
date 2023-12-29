part of 'presentation_bloc.dart';

@immutable
abstract class PresentationState {}

class PresentationInitial extends PresentationState {}

class ProductFetchedState extends PresentationState {
  final List<Product> products;

  ProductFetchedState({required this.products});
}

class LoadingState extends PresentationState {}
