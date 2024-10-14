

import '../../domain/entities/login_entities.dart';

class LoginModel extends LoginEntities {
  LoginModel({
    required String role,
    required String token,
    required String success
  }) : super(token: token,success: success,role: role);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['access_token'],
      success: json['message'],
      role: json['user']['role'],
    );
  }
}
