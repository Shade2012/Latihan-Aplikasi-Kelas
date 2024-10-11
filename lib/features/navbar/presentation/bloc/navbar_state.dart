part of 'navbar_bloc.dart';

abstract class NavbarState extends Equatable {
  final int tabIndex;
  const NavbarState(this.tabIndex);  // Include tabIndex in base class

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
const NavbarLoading() : super(0); // Default tabIndex to 0 in loading state
}
