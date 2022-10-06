part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final List<Product> items;
  const CartState(this.items);

  @override
  List<Object> get props => [items];
}

class CartInitial extends CartState {
  const CartInitial(super.cart);
}
