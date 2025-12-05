import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/onbording/presentation/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_route_projcet_c16/features/splash/presentation/screens/splash_screen.dart';
import 'package:final_route_projcet_c16/features/auth/presentation/screens/login_screen.dart';
import 'package:final_route_projcet_c16/features/auth/presentation/screens/register_screen.dart';
import 'package:final_route_projcet_c16/features/onbording/presentation/blocs/onboarding_bloc.dart';
import 'package:final_route_projcet_c16/features/onbording/presentation/blocs/onboarding_event.dart';
import 'package:final_route_projcet_c16/features/onbording/data/onboarding_repository_impl.dart';
import 'package:final_route_projcet_c16/features/onbording/domain/use_cases/get_onboarding_data_usecase.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view/browse.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view_model/bloc/browse_bloc.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/view/home_screen.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/view_model/bloc/home_bloc.dart';
import 'package:final_route_projcet_c16/features/search/presentation/view/search.dart';
import 'package:final_route_projcet_c16/features/search/presentation/view_model/bloc/search_bloc.dart';
import 'package:final_route_projcet_c16/features/main/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/browser/presentation/view_model/bloc/browse_event.dart';
import '../di/di.dart';

abstract class RoutesManager {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _pageRoute(const SplashScreen());

      case AppRoutes.onboarding:
        return _pageRoute(_buildOnboardingScreen());

      case AppRoutes.login:
        return _pageRoute(LoginScreen());

      case AppRoutes.register:
        return _pageRoute(const RegisterScreen());
      
      case AppRoutes.search:
        {
          return CupertinoPageRoute(
            builder: (_) =>
                BlocProvider(create: (_) => sl<SearchBloc>(), child: Search()),
          );
        }
      case AppRoutes.main:
        {
          return CupertinoPageRoute(
              builder: (context) => MainLayout());
        }
         case AppRoutes.home:
        {
          return CupertinoPageRoute(
              builder: (_) =>
                BlocProvider(create: (_) => sl<MoviesBloc>(), child: HomeScreen()),);
        }
      case AppRoutes.browse:
        {
          return CupertinoPageRoute(
            builder: (_) =>
                BlocProvider(create: (_) =>
                sl<BrowseBloc>()..add(LoadMovieEvent()), child: Browse()),
          );
        }
        default:
        return _pageRoute(const SplashScreen());
    }
  }

  static CupertinoPageRoute _pageRoute(Widget page) {
    return CupertinoPageRoute(builder: (_) => page);
  }

  static Widget _buildOnboardingScreen() {
    return BlocProvider(
      create: (context) {
        final repository = OnboardingRepositoryImpl();
        final useCase = GetOnboardingDataUseCase(repository);
        final bloc = OnboardingBloc(useCase);
        bloc.add(LoadOnboardingData());
        return bloc;
      },
      child: const OnboardingScreen(),
    );
  }
}
