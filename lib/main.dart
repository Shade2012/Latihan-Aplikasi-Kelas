import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/routes/bloc_provider.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/routes/my_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: AppProviders().providers, child: MaterialApp.router(
      routerConfig: MyRouter().router,
    ));
  }
}

