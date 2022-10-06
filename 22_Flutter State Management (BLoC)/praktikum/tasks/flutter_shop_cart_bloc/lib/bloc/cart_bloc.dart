import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shop_cart_bloc/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial([])) {
    on<AddProduct>((event, emit) {
      var existingCart = [...state.items];
      existingCart.add(event.product);
      emit(CartInitial(existingCart));
    });
        on<DeleteProduct>((event, emit) {
      var existingCart = [...state.items];
      existingCart.remove(event.product);
      emit(CartInitial(existingCart));
    });
  }
}
