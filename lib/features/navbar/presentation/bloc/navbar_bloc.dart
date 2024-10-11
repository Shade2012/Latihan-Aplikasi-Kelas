import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const NavbarInitial(0)) {
    on<NavbarEvent>((event, emit) {
      if (event is ChangeTabEvent) {
        emit(NavbarInitial(event.tabIndex));
      }
    });
  }
}
