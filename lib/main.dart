import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/routes/bloc_provider.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/routes/my_route.dart';

void main() {
  initializeDateFormatting('id_ID', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppProviders().providers,
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          routerConfig: MyRouter().router,
        ));
  }
}
