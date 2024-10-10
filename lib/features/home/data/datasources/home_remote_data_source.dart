import 'package:latihan_aplikasi_manajemen_kelas/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<UserModel>> getAllUser();
}
