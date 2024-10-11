import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial(0)) {
    emit(NavbarLoading());
    on<ChangeTabEvent>((event, emit) {
      emit(NavbarLoading());
      emit(NavbarInitial(event.tabIndex));
    });

    on<CheckRoleEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      final prefs = await SharedPreferences.getInstance();
      // final role = prefs.getString('role');
      String role = 'teacher';
      if (role == 'teacher') {
        emit(NavbarInitialTeacher(state.tabIndex)); // Use the current tabIndex
      } else {
        emit(NavbarInitial(state.tabIndex)); // Use the current tabIndex
      }
    });
  }
}

