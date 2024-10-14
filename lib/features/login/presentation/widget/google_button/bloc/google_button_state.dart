part of 'google_button_bloc.dart';

abstract class GoogleButtonState extends Equatable {
  @override
  List<Object?> get props => [];
  const GoogleButtonState();
}

final class GoogleButtonInitial extends GoogleButtonState {}
final class GoogleButtonLoading extends GoogleButtonState {}
final class GoogleButtonSuccess extends GoogleButtonState {
  final GoogleLoginEntities googleButtonEntities;
  GoogleButtonSuccess({required this.googleButtonEntities});

  @override
  List<Object?> get props => [googleButtonEntities];

}
final class GoogleButtonError extends GoogleButtonState {
final String error;

GoogleButtonError(this.error);

@override
List<Object?> get props => [error];
}
