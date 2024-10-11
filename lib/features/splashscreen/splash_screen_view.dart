import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/splashscreen/bloc/splash_screen_bloc.dart';
class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc()..add(CheckTokenEvent()),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            context.pushNamed('home_page');
          } else if (state is SplashNavigateToLogin) {
            context.pushNamed('forgot_second_page');
            // context.pushReplacementNamed('login_page');
          }
        },
        child: Scaffold(
          backgroundColor: ColorsResources.primaryButton,
          body: Center(
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        ),
      ),
    );
  }
}

