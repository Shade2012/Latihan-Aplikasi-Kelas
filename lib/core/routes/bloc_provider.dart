import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/datasources/login_remote_data_source.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/datasources/login_remote_data_source_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/data/repositories/login_repository_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/bloc/login_page_bloc.dart';

import '../../features/splashscreen/bloc/splash_screen_bloc.dart';

class AppProviders {
  final providers = [
    BlocProvider<SplashScreenBloc>(
      create: (context) => SplashScreenBloc(),
    ),
    // RepositoryProvider<AuthRepository>(
    //   create: (context) => AuthRepositoryImpl(
    //     authRemoteDataSource: AuthRemoteDataSourceImpl(),
    //   ),
    // ),

    BlocProvider<LoginPageBloc>(
      create: (context) {
        // final authRepository = RepositoryProvider.of<AuthRepository>(context);
        final loginRepository = LoginRepositoryImpl(
            loginRemoteDataSource: LoginRemoteDataSourceImpl()
        );
        return LoginPageBloc(Login: loginRepository);
      },
    ),
  ];
}
