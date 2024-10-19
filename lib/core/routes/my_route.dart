import 'package:go_router/go_router.dart';

import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordconfirmteacher/presentation/page/change_password_confirm_teacher_page.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/changepasswordteacher/presentation/page/change_password_teacher_page.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/pages/forgot_password.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/pages/forgot_password_second_page.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/pages/forgot_password_third_page.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/page/home_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/page/login_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_admin/pages/notification_admin_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/navbar_teachers/presentation/page/navbar_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/pages/notification_user_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/page/onboarding_page_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/privacypolicyteacher/page/privacy_policy_teacher_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/page/profile_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/splashscreen/splash_screen_view.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_detail_teachers/page/profile_detail_teachers_view.dart';

import '../../features/forgotpassword/presentation/pages/forgot_password.dart';
import '../../features/forgotpassword/presentation/pages/forgot_password_second_page.dart';
import '../../features/forgotpassword/presentation/pages/forgot_password_third_page.dart';
import '../../features/home/presentation/page/home_page_view.dart';
import '../../features/login/presentation/page/login_page_view.dart';
import '../../features/notification_admin/pages/notification_admin_view.dart';
import '../../features/navbar_teachers/presentation/page/navbar_view.dart';
import '../../features/notification_user/pages/notification_user_view.dart';
import '../../features/changepasswordteacher/page/change_password_teacher_view.dart';
import '../../features/onboarding/page/onboarding_page_view.dart';
import '../../features/privacypolicyteacher/page/privacy_policy_teacher_view.dart';
import '../../features/changepasswordconfirmteacher/page/change_password_confirm_teacher_view.dart';

import '../../features/profile_user/page/profile_view.dart';
import '../../features/splashscreen/splash_screen_view.dart';

import '../../features/change_password_confirm_student/pages/change_password_confirm_student_page.dart';
import '../../features/change_password_student/presentation/pages/change_password_page.dart';
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
            name: 'forgot_third_page',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ForgotPasswordThirdPage(),
            ),
          ),
          GoRoute(
              path: '/change_password_teacher_page',
              name: 'change_password_teacher_page',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: ChangePasswordTeacherPage())),
          GoRoute(
              path: '/change_password_confirm_teacher_page',
              name: 'change_password_confirm_teacher_page',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: ChangePasswordConfirmTeacherPage())),
                  const NoTransitionPage(child: ChangePasswordTeacherView())),
          GoRoute(
              path: '/change_password_confirm_teacher_view',
              name: 'change_password_confirm_teacher_view',
              pageBuilder: (context, state) => const NoTransitionPage(
                  child: ChangePasswordConfirmTeacherView())),

          GoRoute(
            path: '/profile_user',
            name: 'profile_user',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ProfilePage()),
          ),
          // GoRoute(
          //   path:
          //       '/detail_profile_teachers_page/:userId', // Use a dynamic parameter
          //   name: 'detail_profile_teachers',
          //   pageBuilder: (context, state) {
          //     final userId = state
          //         .pathParameters['userId']!; // Get the userId from the route
          //     return NoTransitionPage(
          //       child: DetailProfileTeachersView(userId: userId),
          //     );
          //   },
          // ),
          GoRoute(
              path: '/privacy_policy_teachers_page',
              name: 'privacy_policy_teachers_page',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: PrivacyPolicyTeacherView())),
          GoRoute(
            path: '/notification_user',
            name: 'notification_user',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: NotificationUserPage()),
          ),
          GoRoute(
            path: '/notification_admin',
            name: 'notification_admin',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: NotificationAdminPage()),
          ),
          GoRoute(
            path: '/onboarding-page',
            name: 'onboarding-page',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: OnboardingView()),
          ),
          GoRoute(
            path: '/change_password_student',
            name: 'change_password_student',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ChangePasswordPage()),
          ),
          GoRoute(
            path: '/change_password_confirm_student',
            name: 'change_password_confirm_student',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ChangePasswordConfirmStudentPage(),
            ),
          ),
        ],
      );
}
