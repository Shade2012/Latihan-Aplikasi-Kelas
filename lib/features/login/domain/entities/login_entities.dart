import 'package:equatable/equatable.dart';

class LoginEntities extends Equatable {
  final String token;
  final String success;
  final String role;

  LoginEntities( {
    required this.role,
    required this.success,
    required this.token,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [role,token,success];
}
