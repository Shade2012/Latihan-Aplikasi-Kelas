part of 'navbar_bloc.dart';

abstract class NavbarState extends Equatable {
  const NavbarState(this.tabIndex);
  final int tabIndex;

  @override
  List<Object?> get props => [tabIndex];
}

final class NavbarInitial extends NavbarState {
  const NavbarInitial(super.tabIndex);
}

final class NavbarInitialTeacher extends NavbarState {
  const NavbarInitialTeacher(super.tabIndex);
}

final class NavbarLoading extends NavbarState {
  const NavbarLoading() : super(0);
}
