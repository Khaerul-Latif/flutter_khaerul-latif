import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'event.dart';
part 'state.dart';

class ClassBloc extends Bloc<Event, ListContact> {
  final List<Contact> _listItems = [];

  ClassBloc() : super(ListContact()) {
    on<AddContact>((event, emit) {
      _listItems.add(event.contact);
      emit(ListContact(listContact: _listItems));
    });
    on<RemoveContact>((event, emit) {
      _listItems.remove(event.contact);
      emit(ListContact(listContact: _listItems));
    });
    on<LoadContact>((event, emit) {
      emit(ListContact(listContact: _listItems));
    });
  }
}