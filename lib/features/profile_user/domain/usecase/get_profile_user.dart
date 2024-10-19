import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/repositories/profile_user_repository.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/entities/profile_user_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/models/profile_model.dart';

class GetProfileUserUseCase {
  final ProfileUserRepository repository;

  GetProfileUserUseCase({required this.repository});

  Future<ProfileUserEntity> execute() { // Mengembalikan ProfileUserEntity
    return repository.getUserProfile();  // Konsisten dengan return type dari repository
  }
}
