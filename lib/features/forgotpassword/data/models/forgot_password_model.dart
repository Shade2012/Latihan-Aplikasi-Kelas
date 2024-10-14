
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/entities/forgot_password_entities.dart';

class ForgotPasswordModel extends ForgotPasswordEntities {
  ForgotPasswordModel({
   required String message,
    String? accessToken,
   required int status
  }) : super(message: message,token: accessToken,status: status,);

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(
      status: json['status'],
      accessToken: json['access_token'] ?? '',
      message: json['message']
    );
  }
}
