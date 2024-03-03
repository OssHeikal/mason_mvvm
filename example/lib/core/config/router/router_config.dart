import 'package:al_sadeem_app/features/auth/presentation/view/screens/attach_docs_screen.dart';
import 'package:al_sadeem_app/features/auth/presentation/view/screens/login_screen.dart';
import 'package:al_sadeem_app/features/auth/presentation/view/screens/verify_forget_password_screen.dart';
import 'package:al_sadeem_app/features/bookings/presentation/view/screens/booking_details_screen.dart';
import 'package:al_sadeem_app/features/cars/presentation/view/screens/car_details_screen.dart';
import 'package:al_sadeem_app/features/filter/presentation/view/screens/filter_screen.dart';
import 'package:al_sadeem_app/features/home/presentation/view/screens/map_screen.dart';
import 'package:al_sadeem_app/features/notifications/presentation/view/screens/notifications_screen.dart';
import 'package:al_sadeem_app/features/profile/presentation/view/screens/about_us_screen.dart';
import 'package:al_sadeem_app/features/profile/presentation/view/screens/profile_screen.dart';
import 'package:al_sadeem_app/features/profile/presentation/view/screens/terms_screen.dart';
import 'package:al_sadeem_app/features/shared/presentation/view/screens/scaffold_with_nav_bar_screen.dart';
import 'package:al_sadeem_app/features/splash/view/onboarding_screen.dart';
import 'package:al_sadeem_app/features/splash/view/splash_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/view/screens/forget_password_screen.dart';
import '../../../features/auth/presentation/view/screens/register_screen.dart';
import '../../../features/auth/presentation/view/screens/reset_password_screen.dart';
import '../../../features/auth/presentation/view/screens/verify_code_screen.dart';
import '../../../features/bookings/presentation/view/screens/bookings_screen.dart';
import '../../../features/cars/presentation/view/screens/car_extras_screen.dart';
import '../../../features/cars/presentation/view/screens/confirm_car_booking_details.dart';
import '../../../features/cars/presentation/view/screens/payment_details_screen.dart';
import '../../../features/explore/presentation/view/screens/explore_screen.dart';
import '../../../features/home/presentation/view/screens/home_screen.dart';
import '../../../features/home/presentation/view/screens/search_result_screen.dart';
import '../../../features/profile/presentation/view/screens/contact_us_screen.dart';
import '../../../features/profile/presentation/view/screens/language_screen.dart';
import '../../../features/profile/presentation/view/screens/settings_screen.dart';
import '../../resources/resources.dart';
import '../extensions/widget_extensions.dart';
import 'page_transition.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class RouteConfigs {
  // All Routes in the app
  static final GoRouter routerConfig = GoRouter(
    initialLocation: AppRoutes.home.path,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    observers: [BotToastNavigatorObserver()],
    routes: [
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        pageBuilder: (context, state) => const SplashScreen().buildPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding.path,
        name: AppRoutes.onboarding.name,
        pageBuilder: (context, state) => const OnboardingScreen().buildPage(),
      ),
      GoRoute(
        path: AppRoutes.register.path,
        name: AppRoutes.register.name,
        pageBuilder: (context, state) => const RegisterScreen().buildPage(transition: PageTransitions.cupertino),
      ),
      GoRoute(
        path: AppRoutes.verifyCode.path,
        name: AppRoutes.verifyCode.name,
        pageBuilder: (context, state) => const VerifyCodeScreen().buildPage(),
      ),
      GoRoute(
        path: AppRoutes.attachDocs.path,
        name: AppRoutes.attachDocs.name,
        pageBuilder: (context, state) => const AttachDocsScreen().buildPage(),
      ),
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        pageBuilder: (context, state) => const LoginScreen().buildPage(transition: PageTransitions.cupertino),
        routes: [
          GoRoute(
            path: AppRoutes.forgetPassword.path,
            name: AppRoutes.forgetPassword.name,
            pageBuilder: (context, state) => const ForgetPasswordScreen().buildPage(
              transition: PageTransitions.cupertino,
            ),
          ),
          GoRoute(
            path: AppRoutes.verifyForgetPassword.path,
            name: AppRoutes.verifyForgetPassword.name,
            pageBuilder: (context, state) => const VerifyForgetPassword().buildPage(
              transition: PageTransitions.cupertino,
            ),
          ),
          GoRoute(
            path: AppRoutes.resetPassword.path,
            name: AppRoutes.resetPassword.name,
            pageBuilder: (context, state) => const ResetPasswordScreen().buildPage(
              transition: PageTransitions.cupertino,
            ),
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) => ScaffoldWithNavBarScreen(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            pageBuilder: (context, state) => const HomeScreen().buildPage(),
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.searchResult.path,
                name: AppRoutes.searchResult.name,
                pageBuilder: (context, state) => const SearchResultScreen().buildPage(
                  transition: PageTransitions.slideUp,
                ),
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.map.path,
                name: AppRoutes.map.name,
                pageBuilder: (context, state) => const MapScreen().buildPage(
                  transition: PageTransitions.cupertino,
                ),
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.filter.path,
                name: AppRoutes.filter.name,
                pageBuilder: (context, state) => const FilterScreen().buildPage(transition: PageTransitions.slideUp),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.explore.path,
            name: AppRoutes.explore.name,
            pageBuilder: (context, state) => const ExploreScreen().buildPage(),
          ),
          GoRoute(
            path: AppRoutes.bookings.path,
            name: AppRoutes.bookings.name,
            pageBuilder: (context, state) => const BookingsScreen().buildPage(),
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.bookingDetails.path,
                name: AppRoutes.bookingDetails.name,
                pageBuilder: (context, state) => BookingDetailsScreen(
                  status: state.extra as BookingStatus,
                ).buildPage(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.settings.path,
            name: AppRoutes.settings.name,
            pageBuilder: (context, state) => const SettingsScreen().buildPage(),
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.contactUs.path,
                name: AppRoutes.contactUs.name,
                pageBuilder: (context, state) => const ContactUsScreen().buildPage(
                  transition: PageTransitions.cupertino,
                ),
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.profile.path,
                name: AppRoutes.profile.name,
                pageBuilder: (context, state) => const ProfileScreen().buildPage(transition: PageTransitions.cupertino),
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.aboutUs.path,
                name: AppRoutes.aboutUs.name,
                pageBuilder: (context, state) => const AboutUsScreen().buildPage(transition: PageTransitions.cupertino),
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.terms.path,
                name: AppRoutes.terms.name,
                pageBuilder: (context, state) => const TermsScreen().buildPage(transition: PageTransitions.cupertino),
              ),
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                path: AppRoutes.language.path,
                name: AppRoutes.language.name,
                pageBuilder: (context, state) => const LanguageScreen().buildPage(
                  transition: PageTransitions.cupertino,
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.carDetails.path,
        name: AppRoutes.carDetails.name,
        pageBuilder: (context, state) => const CarDetailsScreen().buildPage(transition: PageTransitions.cupertino),
        routes: [
          GoRoute(
            path: AppRoutes.carExtras.path,
            name: AppRoutes.carExtras.name,
            pageBuilder: (context, state) => const CarExtrasScreen().buildPage(transition: PageTransitions.cupertino),
          ),
          GoRoute(
            path: AppRoutes.confirmCarBooking.path,
            name: AppRoutes.confirmCarBooking.name,
            pageBuilder: (context, state) => const ConfirmCarBookingScreen().buildPage(
              transition: PageTransitions.cupertino,
            ),
          ),
          GoRoute(
            path: AppRoutes.paymentDetails.path,
            name: AppRoutes.paymentDetails.name,
            pageBuilder: (context, state) => const PaymentDetailsScreen().buildPage(
              transition: PageTransitions.cupertino,
            ),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: AppRoutes.notifications.path,
        name: AppRoutes.notifications.name,
        pageBuilder: (context, state) => const NotificationsScreen().buildPage(
          transition: PageTransitions.cupertino,
        ),
      ),
    ],
  );
}
