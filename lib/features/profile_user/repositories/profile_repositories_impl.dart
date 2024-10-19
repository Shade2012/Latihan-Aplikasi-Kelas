import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/entities/profile_user_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/data/datasource/profile_user_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/repositories/profile_user_repository.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/models/profile_model.dart';

class ProfileUserRepositoryImpl implements ProfileUserRepository {
  final ProfileUserDataSource profileUserDataSource;

  ProfileUserRepositoryImpl({required this.profileUserDataSource});

      @override
    Future<ProfileUserEntity> getUserProfile() async {
      try {
        final ProfileUserModel profileUserModel = await profileUserDataSource.getUserProfile();
        return profileUserModel; 
      } catch (e) {
        throw Exception("Error fetching profile: ${e.toString()}");
      }
    }
}
