import 'package:mayday/features/Auth/view/login.dart';
import 'package:mayday/features/Auth/view/otp_screen.dart';
import 'package:mayday/features/Auth/view/signup.dart';
import 'package:mayday/features/Call/view/call_screen.dart';
import 'package:mayday/features/Chat/view/chat_screen.dart';
import 'package:mayday/features/Friends/view/network_screen.dart';
import 'package:mayday/features/Home/view/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return SignupPage();
        },
        routes: [
          GoRoute(
            path: 'chat',
            builder: (context, state) {
              return const ChatScreen();
            },
          ),
          GoRoute(
            path: 'network',
            builder: (context, state) {
              return const NetworkScreen();
            },
          ),
          GoRoute(
            path: 'call',
            builder: (context, state) {
              return const CallScreen();
            },
          ),
          GoRoute(
            path: 'login',
            builder: (context, state) {
              return LoginPage();
            },
          ),
          GoRoute(
            path: 'home',
            builder: (context, state) {
              return Home();
            },
          ),
          GoRoute(
              path: 'otp',
              builder: (context, state) {
                Map<String, String> data = state.extra as Map<String, String>;
                return OTPScreen(
                  phnNumber: data["phnNumber"]!,
                  verificationId: data["verificationId"]!,
                );
              })
        ])
  ]);
}
