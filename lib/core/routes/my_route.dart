import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/page/home_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/page/login_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/navbar/presentation/page/navbar_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/splashscreen/splash_screen_view.dart';

class MyRouter {
  get router => GoRouter(
        // initialLocation: '/alluser',
        initialLocation: '/splash',
        routes: [
          GoRoute(
            name: 'splash',
            path: '/splash',
            builder: (context, state) => const SplashScreenView(),
          ),
          GoRoute(
            name: 'navbar',
            path: '/navbar',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: NavbarView()),
          ),
          GoRoute(
            name: 'home_page',
            path: '/home_page',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomePageView()),
          ),
          GoRoute(
            name: 'login_page',
            path: '/login-page',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LoginPageView()),
          ),
        ],
      );
}
