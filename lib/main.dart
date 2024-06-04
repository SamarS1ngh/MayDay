import 'package:mayday/Utils/Routes/app_router_config.dart';
import 'package:mayday/Utils/data/local/local_storage_service.dart';
import 'package:mayday/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mayday/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalStorageService.init();
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
