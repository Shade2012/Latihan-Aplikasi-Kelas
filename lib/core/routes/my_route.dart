import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/pages/forgot_password.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/pages/forgot_password_second_page.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/pages/forgot_password_third_page.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/page/home_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/page/login_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/navbar_teachers/presentation/page/navbar_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/splashscreen/splash_screen_view.dart';
import '../../features/navbar/presentation/page/navbar_view.dart';

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
            name: 'navbar_teacher',
            path: '/navbar_teacher',
            pageBuilder: (context, state) =>
            const NoTransitionPage(child: NavbarTeacherView()),
          ),
          GoRoute(
            path: '/home_page',
            name: 'home_page',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomePageView()),
          ),
          GoRoute(
            path: '/login-page',
            name: 'login_page',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: LoginPageView()),
          ),
          GoRoute(
            path: '/forgot_password_page',
            name: 'forgot_page',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ForgotPassword()),
          ),
          GoRoute(
            path: '/forgot_password_second_page',
            name: 'forgot_second_page',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ForgotPasswordSecondPage()),
          ),
          GoRoute(
          path: '/forgot_password_third_page',
          name:'forgot_third_page',
          pageBuilder: (context, state) => NoTransitionPage(child: ForgotPasswordThirdPage()),
      ),
        ],
      );
}
