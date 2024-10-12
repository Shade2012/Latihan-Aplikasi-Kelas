import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBlocTeacher extends Bloc<NavbarEventTeacher, NavbarStateTeacher> {
  NavbarBlocTeacher() : super(NavbarInitial(0)) {
    emit(NavbarLoading());
    on<ChangeTabEvent>((event, emit) {
      emit(NavbarLoading());
      emit(NavbarInitial(event.tabIndex));
    });
  }
}

