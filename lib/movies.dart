import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/core/routes/route_generator.dart';
import 'package:final_route_projcet_c16/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
return ScreenUtilInit(
  designSize: const Size(393, 841),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) => MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: RoutesManager.router,
    initialRoute: AppRoutes.login,
    theme: ThemeManager.darkTheme,
  ),
);

  }
}
