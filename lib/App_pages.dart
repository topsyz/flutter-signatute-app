import 'package:get/get.dart';
import 'package:signio/SCREENS/collect_success/collect_success.dart';
import 'package:signio/SCREENS/forgot_password/forgot_password_screen.dart';
import 'package:signio/SCREENS/login_success/login_success_screen.dart';
import 'package:signio/SCREENS/sign_in/sign_in_screen.dart';
import 'package:signio/SCREENS/sign_up/sign_up_screen.dart';
import 'package:signio/SCREENS/splash_screen.dart';
import 'package:signio/Signpd/app/modules/home/bindings/home_binding.dart';
import 'package:signio/Signpd/app/modules/home/views/home_view.dart';
import 'package:signio/Signpd/app/modules/view_document/bindings/view_document_binding.dart';
import 'package:signio/Signpd/app/modules/view_document/views/view_document_view.dart';
import 'package:signio/collect_cheque_screen/collect_screen.dart';
import 'package:signio/general_home_page/general_home.dart';
import 'package:signio/history/History_screen.dart';
import 'package:signio/init_screen.dart';
import 'package:signio/profile/profile_screen.dart';
part 'App_routs.dart';
class AppPages {
  AppPages._();

  static const INITIAL = Routes.LoginSuccessScreen;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),),
    GetPage(
      name: _Paths.VIEW_DOCUMENT,
      page: () => ViewDocumentView(),
      binding: ViewDocumentBinding(),),
    GetPage(name: InitScreen.routeName,
        page: () => const InitScreen()),
    GetPage(name: SplashScreen.routeName,
        page: () => const SplashScreen()),
    GetPage(name: SignInScreen.routeName,
        page: () => const SignInScreen()),
    GetPage(name: SignUpScreen.routeName,
        page: () => const SignUpScreen()),
    GetPage(name: GeneralHomeScreen.routeName,
        page: () => const GeneralHomeScreen()),
    GetPage(name: ProfileScreen.routeName,
        page: () =>  ProfileScreen()),
    GetPage(name: LoginSuccessScreen.routeName,
        page: () => const LoginSuccessScreen()),
    GetPage(name: HistoryScreen.routeName,
        page: () => HistoryScreen()),
    GetPage(name: ForgotPasswordScreen.routeName,
        page: () => const ForgotPasswordScreen()),
    GetPage(name: CollectScreen.routeName,
        page: () => const CollectScreen()),
    GetPage(name: CollcetSuccessfully.routeName,
        page: () => const CollcetSuccessfully()),
  ];
}
