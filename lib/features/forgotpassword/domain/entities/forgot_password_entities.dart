import 'package:equatable/equatable.dart';

class ForgotPasswordEntities extends Equatable{
  String? token;
  String message;
  int status;
  ForgotPasswordEntities({this.token,required this.message,required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [token,status,message];

}
