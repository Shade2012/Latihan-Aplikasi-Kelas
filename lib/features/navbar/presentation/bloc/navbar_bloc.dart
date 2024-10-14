import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial(0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(NavbarLoading());
      emit(NavbarInitial(event.tabIndex));
    });
  }
}

