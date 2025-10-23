import 'package:get/get.dart';
import 'package:nail_connect_admin/views/screens/auth/otp_verification_screen.dart';
import 'package:nail_connect_admin/views/screens/dashboard/dashboard_screen.dart';
import 'package:nail_connect_admin/views/screens/jobs/jobs_screen.dart';
import 'package:nail_connect_admin/views/screens/reports/reports_screen.dart';
import 'package:nail_connect_admin/views/screens/settings/settings_screen.dart';
import 'package:nail_connect_admin/views/screens/side_menu/side_menu_screen.dart';
import 'package:nail_connect_admin/views/screens/users/users_screen.dart';

import '../views/screens/auth/forgot_password_screen.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/auth/new_password_screen.dart';
import 'app_strings.dart';
import 'screen_bindings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kLoginScreenRoute,
        page: () => const LoginScreen(),
        binding: ScreenBindings(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 700),
      ),
      GetPage(
        name: kForgotPasswordScreenRoute,
        page: () => const ForgotPasswordScreen(),
        binding: ScreenBindings(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 700),
      ),
      GetPage(
        name: kVerifyOtpScreenRoute,
        page: () => const OtpVerificationScreen(),
        binding: ScreenBindings(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 700),
      ),
      GetPage(
        name: kNewPasswordScreenRoute,
        page: () => const NewPasswordScreen(),
        binding: ScreenBindings(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 700),
      ),
      GetPage(
        name: kDashboardScreenRoute,
        page: () => const DashboardScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSideMenuScreenRoute,
        page: () => const SideMenuScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kReportsScreenRoute,
        page: () => ReportsScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kUsersScreenRoute,
        page: () => const UsersScreen(),
        binding: ScreenBindings(),
      ),

      GetPage(
        name: kJobsScreenRoute,
        page: () => const JobsScreen(),
        binding: ScreenBindings(),
      ),
      GetPage(
        name: kSettingsScreenRoute,
        page: () => const SettingsScreen(),
        binding: ScreenBindings(),
      ),
      
    ];
  }
}
