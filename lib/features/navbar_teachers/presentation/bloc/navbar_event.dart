part of 'navbar_bloc.dart';

abstract class NavbarEventTeacher extends Equatable {
  const NavbarEventTeacher();

  @override
  List<Object?> get props => [];
}

class CheckRoleEvent extends NavbarEventTeacher {
  const CheckRoleEvent();  // No tabIndex needed
}

final class ChangeTabEvent extends NavbarEventTeacher {
final int tabIndex;

const ChangeTabEvent(this.tabIndex);

@override
List<Object> get props => [tabIndex];
}
