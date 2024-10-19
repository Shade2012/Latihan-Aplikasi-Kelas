import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/entities/profile_user_entities.dart';

abstract class ProfileUserRepository {
  Future<ProfileUserEntity> getUserProfile(); 
}
