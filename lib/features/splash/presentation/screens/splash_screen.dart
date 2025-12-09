import 'package:flutter/material.dart';
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/core/services/session_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAppState();
  }

  Future<void> _checkAppState() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final appState = await SessionService.getAppLaunchState();
    print('App launch state: $appState'); 

    switch (appState) {
      case AppLaunchState.authenticated:
        print('Navigating to home - user authenticated');
        Navigator.pushReplacementNamed(context, AppRoutes.main);
        break;

      case AppLaunchState.needsAuth:
        print('Navigating to login - needs authentication');
        Navigator.pushReplacementNamed(context, AppRoutes.login);
        break;

      case AppLaunchState.needsOnboarding:
        print('Navigating to onboarding - first time user');
        Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              width: 140,
              height: 140,
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/branding_image.png",
              height: 40,
            ),

            const SizedBox(height: 6),

            const Text(
              "Supervised by Mohamed Nabil",
              style: TextStyle(
                color: ColorManager.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
