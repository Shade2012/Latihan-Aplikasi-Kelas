import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/images.dart';
import 'bloc/splash_screen_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc()..add(SplashScreenStarted()),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            context.pushReplacementNamed('navbar');
          } else if (state is SplashNavigateToOnBoarding) {
            context.pushReplacementNamed('onboarding-page');
          } else if (state is SplashNavigateToLogin) {
            context.pushReplacementNamed('login_page');
          }
          if (state is SplashNavigateToHomeTeacher) {
            context.pushReplacementNamed('navbar_teacher');
          }
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset(Images.logoMain),
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
