import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/routes/route_generator.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/core/theme/theme_manager.dart';
import 'package:final_route_projcet_c16/core/services/session_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  late Future<String> _initializationFuture;

  @override
  void initState() {
    super.initState();
    _initializationFuture = _initializeApp();
  }

  Future<String> _initializeApp() async {
    try {
      await SessionService.init();
      final appState = await SessionService.getAppLaunchState();

      switch (appState) {
        case AppLaunchState.authenticated:
          return AppRoutes.main;
        case AppLaunchState.needsAuth:
          return AppRoutes.login;
        case AppLaunchState.needsOnboarding:
          return AppRoutes.onboarding;
      }
    } catch (e) {
      // If initialization fails, default to onboarding
      return AppRoutes.onboarding;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _initializationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: ColorManager.background,
              body: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              ),
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          // If there's an error or no data, default to onboarding
          return ScreenUtilInit(
            designSize: const Size(393, 841),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RoutesManager.router,
              initialRoute: AppRoutes.onboarding,
              theme: ThemeManager.darkTheme,
            ),
          );
        }

        final initialRoute = snapshot.data!;

        return ScreenUtilInit(
          designSize: const Size(393, 841),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.router,
            initialRoute: initialRoute,
            theme: ThemeManager.darkTheme,
          ),
        );
      },
    );
  }
}
