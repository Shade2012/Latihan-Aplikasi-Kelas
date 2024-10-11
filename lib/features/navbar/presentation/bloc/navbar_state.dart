part of 'navbar_bloc.dart';

sealed class NavbarState extends Equatable {
  const NavbarState(this.tabIndex);

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}

final class NavbarInitial extends NavbarState {
  const NavbarInitial(super.tabIndex);
}
