import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future <LoginModel> login(String email, String password);//kemungkinan itu ada 2 hasil :  gagal (failure) / berhasil (List User)
}
