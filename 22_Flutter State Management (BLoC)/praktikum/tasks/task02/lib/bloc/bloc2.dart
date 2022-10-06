import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc1.dart';

class Favorite extends Bloc<Event, ListFavorite> {
  final List<String> _listFav = [];

  Favorite() : super(ListFavorite()) {
    on<AddFavContact>((event, emit) {
      _listFav.add(event.name);
      emit(ListFavorite(listFavorite: _listFav));
    });
    on<RemoveFavContact>((event, emit) {
      if (_listFav.contains(event.name)) {
        _listFav.remove(event.name);
        emit(ListFavorite(listFavorite: _listFav));
      }
    });
  }
}
