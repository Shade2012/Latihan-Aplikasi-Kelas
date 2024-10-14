import 'package:equatable/equatable.dart';

class GoogleLoginEntities extends Equatable {
  final String name;
  final String email;
  final String profilePicture;

  GoogleLoginEntities( {
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,profilePicture];
}
