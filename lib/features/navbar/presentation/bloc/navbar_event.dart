part of 'navbar_bloc.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeTabEvent extends NavbarEvent {
final int tabIndex;

const ChangeTabEvent(this.tabIndex);

@override
List<Object> get props => [tabIndex];
}
