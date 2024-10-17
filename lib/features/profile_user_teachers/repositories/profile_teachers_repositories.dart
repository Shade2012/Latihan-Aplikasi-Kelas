import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user_teachers/models/profile_teachers_model.dart';

class ProfileTeachersRepository {
  Future<ProfileTeachers> fetchProfileTeachers() async {
    // Simulasi data profile
    await Future.delayed(Duration(seconds: 2)); // Simulasi delay network
    return ProfileTeachers(
      name: "Ajar Abu Hairoh",
      role: "Guru",
      email: "AjarAH@gmail.com",
      imageUrl: "https://via.placeholder.com/150",
    );
  }
}
