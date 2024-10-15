import 'package:equatable/equatable.dart';

abstract class DetailProfileEvent extends Equatable {
  const DetailProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends DetailProfileEvent {
  final String userId;

  const LoadProfileEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UpdateProfileEvent extends DetailProfileEvent {
  final String userId;
  final Map<String, dynamic> updatedData;

  const UpdateProfileEvent(this.userId, this.updatedData);

  @override
  List<Object?> get props => [userId, updatedData];
}
