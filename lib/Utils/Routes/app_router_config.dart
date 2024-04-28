import 'package:fluttemp/View/Pages/Call%20Screen/call_screen.dart';
import 'package:fluttemp/View/Pages/Chat%20Screen/chat_screen.dart';
import 'package:fluttemp/View/Pages/Friends/network_screen.dart';
import 'package:fluttemp/View/Pages/HomeScreen/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return Home();
        },
        routes: [
          GoRoute(
            path: 'chat',
            builder: (context, state) {
              return ChatScreen();
            },
          ),
          GoRoute(
            path: 'network',
            builder: (context, state) {
              return NetworkScreen();
            },
          ),
          GoRoute(
            path: 'call',
            builder: (context, state) {
              return CallScreen();
            },
          ),
        ])
  ]);
}
