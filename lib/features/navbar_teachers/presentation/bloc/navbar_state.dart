part of 'navbar_bloc.dart';

abstract class NavbarStateTeacher extends Equatable {
  final int tabIndex;
  const NavbarStateTeacher(this.tabIndex);  // Include tabIndex in base class

  @override
  List<Object?> get props => [tabIndex];
}

final class NavbarInitial extends NavbarStateTeacher {
const NavbarInitial(super.tabIndex);
}

final class NavbarLoading extends NavbarStateTeacher {
const NavbarLoading() : super(0); // Default tabIndex to 0 in loading state
}
