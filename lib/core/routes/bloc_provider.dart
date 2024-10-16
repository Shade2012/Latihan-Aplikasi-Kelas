import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/data/datasources/forgotpassword_remote_data_source_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/data/repositories/forgotpassword_repository_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/usecases/forgot_password_reset_password.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/usecases/forgot_password_sendotp.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/domain/usecases/forgot_password_verifyotp.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/bloc/forgot_password_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/datasources/home_teachers_remote_data_source_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/data/repositories/home_teachers_repository_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/usecases/get_kelas.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/usecases/get_pelajaran.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/bloc/home_page_teacher_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/datasources/login_remote_data_source_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/repositories/login_repository_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/usecases/google_login.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/domain/usecases/login.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/bloc/login_page_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/widget/google_button/bloc/google_button_bloc.dart';
import '../../features/home_teachers/domain/usecases/get_weekly_schedule.dart';
import '../../features/splashscreen/bloc/splash_screen_bloc.dart';

class AppProviders {
  final providers = [
    BlocProvider<SplashScreenBloc>(
      create: (context) => SplashScreenBloc(),
    ),
    BlocProvider<HomePageTeacherBloc>(create: (context) {
      final homepageTeacherRepository = HomeTeachersRepositoryImpl(
          homeTeachersRemoteDataSourceImpl: HomeTeachersRemoteDataSourceImpl()
      );
      final getScheduleWeekly = GetScheduleWeekly(homepageTeacherRepository);
      final getKelas = GetKelas(homepageTeacherRepository);
      final getPelajaran = GetPelajaran(homepageTeacherRepository);
      return HomePageTeacherBloc(getScheduleWeekly: getScheduleWeekly, getPelajaran: getPelajaran,getKelas: getKelas);
    },),
    BlocProvider<LoginPageBloc>(
      create: (context) {
        // final authRepository = RepositoryProvider.of<AuthRepository>(context);
        final loginRepository = LoginRepositoryImpl(
            loginRemoteDataSource: LoginRemoteDataSourceImpl()
        );
        return LoginPageBloc(Login: Login(loginRepository));
      },
    ),
    BlocProvider<GoogleButtonBloc>(
      create: (context) {
        // final authRepository = RepositoryProvider.of<AuthRepository>(context);
        final loginRepository = LoginRepositoryImpl(
            loginRemoteDataSource: LoginRemoteDataSourceImpl()
        );
        return GoogleButtonBloc(GoogleLogin: GoogleLogin(loginRepository));
      },
    ),
    BlocProvider<ForgotPasswordBloc>(
      create: (context) {
        final forgotpasswordRepository = ForgotpasswordRepositoryImpl(
            forgotpasswordRemoteDataSource: ForgotpasswordRemoteDataSourceImpl()
        );
        return ForgotPasswordBloc(ForgotPasswordResetPassword: ForgotPasswordResetPassword(forgotpasswordRepository) ,ForgotPasswordSendOtp: ForgotPasswordSendOtp(forgotpasswordRepository),ForgotPasswordVerifyOtp: ForgotPasswordVerifyOtp(forgotpasswordRepository));
      },
    ),
  ];
}
