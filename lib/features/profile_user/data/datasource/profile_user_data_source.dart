import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/models/profile_model.dart';

abstract class ProfileUserDataSource {
  Future<ProfileUserModel> getUserProfile();
}
