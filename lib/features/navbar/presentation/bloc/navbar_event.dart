part of 'navbar_bloc.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object?> get props => [];
}

class CheckRoleEvent extends NavbarEvent {
  const CheckRoleEvent();  // No tabIndex needed
}

final class ChangeTabEvent extends NavbarEvent {
final int tabIndex;

const ChangeTabEvent(this.tabIndex);

@override
List<Object> get props => [tabIndex];
}
