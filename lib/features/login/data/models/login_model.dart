

import '../../domain/entities/login_entities.dart';

class LoginModel extends LoginEntities {
  LoginModel({
    required String token,
    required bool success
  }) : super(token: token,success: success);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      success: json['success'],
    );
  }
}
