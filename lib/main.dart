import 'package:fluttemp/Utils/Routes/app_router_config.dart';
import 'package:fluttemp/Utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Supabase.initialize(
      url: 'https://eduqgmxtuefnnxzqnqym.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVkdXFnbXh0dWVmbm54enFucXltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ1ODY3MDMsImV4cCI6MjAzMDE2MjcwM30.eMA4Dk9cQLJZcq3UL3l0aFqAvd6xRSbiR7ygxKJmO18');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              actionsIconTheme: const IconThemeData(color: Colors.white),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: AppColorsTheme.dark().bgColor),
          extensions: [
            AppColorsTheme.dark(),
            AppTypography.main(),
            AppDimensionsTheme.main(View.of(context))
          ]),
    );
  }
}
