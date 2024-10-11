part of 'navbar_bloc.dart';

sealed class NavbarEvent extends Equatable {
  const NavbarEvent(this.tabIndex);

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}

final class ChangeTabEvent extends NavbarEvent {
  const ChangeTabEvent(super.tabIndex);
}
