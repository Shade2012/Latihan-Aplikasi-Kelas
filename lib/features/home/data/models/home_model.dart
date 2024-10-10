// class User


import '../../domain/entities/user_entities.dart';

class UserModel extends User{

  const UserModel({
    required super.id,
    super.profilePicture,
    required super.nameUser,
    required super.email,
    super.emailVerified,
    required super.createdAt,
    required super.updateAt,
  });

  factory UserModel.fromJson(Map<String,dynamic> user){
    return UserModel(
        id: user['id'],
        nameUser: user['name'],
        profilePicture: user['profile_picture'] ?? '',
        email: user['email'],
        emailVerified: user['email_verified_at'] ?? '',
        createdAt: user['created_at'],
        updateAt: user['updated_at']
    );
  }

  Map<String,dynamic> toJson() {
    return{
      'id': id,
      'name':nameUser,
      'profile_picture': profilePicture,
      'email':email,
      'email_verified_at':emailVerified,
      'created_at':createdAt,
      'update_at':updateAt
    };
  }

  //List <Map> -> List<UserModel>
  static List<UserModel> fromJsonList(List data){
    if(data.isEmpty) return[];
    return data.map((singleData) => UserModel.fromJson(singleData),).toList();
  }
}
