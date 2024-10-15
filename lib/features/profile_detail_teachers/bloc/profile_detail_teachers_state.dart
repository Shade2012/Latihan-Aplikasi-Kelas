import 'package:equatable/equatable.dart';

abstract class DetailProfileTeachersState extends Equatable {
  const DetailProfileTeachersState();

  @override
  List<Object?> get props => [];
}

class ProfileTeachersInitialState extends DetailProfileTeachersState {}

class ProfileTeachersLoadingState extends DetailProfileTeachersState {}

class ProfileTeachersLoadedState extends DetailProfileTeachersState {
  final Map<String, dynamic> profileTeachersData;

  const ProfileTeachersLoadedState(this.profileTeachersData);

  @override
  List<Object?> get props => [profileTeachersData];
}

class ProfileTeachersErrorState extends DetailProfileTeachersState {
  final String message;

  const ProfileTeachersErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
