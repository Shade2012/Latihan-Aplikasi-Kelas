part of 'navbar_bloc.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeTabEvent extends NavbarEvent {
  const ChangeTabEvent(this.tabIndex);
  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}
