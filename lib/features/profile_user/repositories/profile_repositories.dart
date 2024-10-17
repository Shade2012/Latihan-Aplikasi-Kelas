import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/models/profile_model.dart';

class ProfileRepository {
  Future<Profile> fetchProfile() async {
    // Simulasi data profile
    await Future.delayed(Duration(seconds: 2)); // Simulasi delay network
    return Profile(
      name: "Abid Fadullah",
      role: "Murid",
      email: "bblacks12@gmail.com",
      imageUrl: "https://via.placeholder.com/150",
    );
  }
}
