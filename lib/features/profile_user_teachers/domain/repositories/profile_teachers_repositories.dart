import '../../data/models/profile_teachers_model.dart';

class ProfileTeachersRepository {
  Future<ProfileTeachers> fetchProfileTeachers() async {
    return ProfileTeachers(
      name: 'Ajar Abu Hairoh',
      role: 'Guru',
      email: 'AjarAH@gmail.com',
      imageUrl: 'https://via.placeholder.com/150',
    );
  }
}
