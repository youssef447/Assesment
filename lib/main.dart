import 'package:assesment_app/config/end_points/end_points.dart';
import 'package:assesment_app/config/extensions/extensions.dart';
import 'package:assesment_app/config/services/dio_helper.dart';
import 'package:assesment_app/core/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/dependencies/injection.dart';
import 'config/routes/routeGenerator.dart';
import 'config/routes/routes.dart';
import 'view/home_page/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init(
    baseUrl: ApiEndPoints.baseUrl,
  );
  configurationDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
            context.isDesktop ? const Size(1000, 800) : const Size(390, 854),
        fontSizeResolver: /* context.isDesktop
          ? (fontSize, instance) => FontSizeResolvers.width(fontSize, instance)
          : */
            (fontSize, instance) =>
                FontSizeResolvers.height(fontSize, instance),
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter App',
            theme: AppTheme.darkTheme,
            home: const HomeScreen(),
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            initialRoute: AppRoutes.homeScreen,
          );
        });
  }
}
