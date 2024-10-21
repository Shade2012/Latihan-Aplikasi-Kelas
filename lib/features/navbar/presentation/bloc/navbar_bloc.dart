import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const NavbarInitial(0)) {
    on<ChangeTabEvent>((event, emit) {
      emit(NavbarInitial(event.tabIndex));
    });
  }
}
