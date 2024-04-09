import 'package:fluttemp/Utils/Routes/app_router_config.dart';
import 'package:fluttemp/Utils/constants/app_colors.dart';
import 'package:fluttemp/Utils/constants/app_constants.dart';
import 'package:fluttemp/Utils/constants/app_dimensions.dart';
import 'package:fluttemp/Utils/provider/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'ViewModel/someClass_VM/someclass.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: Theme.of(context).copyWith(extensions: [
          AppColorsTheme.dark(),
          AppTypography.main(),
          AppDimensionsTheme.main(View.of(context))
        ]),
      ),
    );
  }
}
