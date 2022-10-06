part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  final Product product;
  const CartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class AddProduct extends CartEvent {
  const AddProduct(super.product);
}

class DeleteProduct extends CartEvent {
  const DeleteProduct(super.product);
}

