import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/auth/login/presentation/screens/ForgetPasswordScreen.dart';
import 'package:final_route_projcet_c16/features/onbording/presentation/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_route_projcet_c16/features/auth/login/presentation/screens/login_screen.dart';
import 'package:final_route_projcet_c16/features/auth/register/presentation/screens/register_screen.dart';
import 'package:final_route_projcet_c16/features/onbording/presentation/blocs/onboarding_bloc.dart';
import 'package:final_route_projcet_c16/features/onbording/presentation/blocs/onboarding_event.dart';
import 'package:final_route_projcet_c16/features/onbording/data/onboarding_repository_impl.dart';
import 'package:final_route_projcet_c16/features/onbording/domain/use_cases/get_onboarding_data_usecase.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view/browse.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view_model/bloc/browse_bloc.dart';
import 'package:final_route_projcet_c16/features/main/main_layout.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view/update_profile.dart';
import '../../features/browser/presentation/view_model/bloc/browse_event.dart';
import '../di/di.dart';

abstract class RoutesManager {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return _pageRoute(_buildOnboardingScreen());

      case AppRoutes.login:
        return _pageRoute(LoginScreen());

      case AppRoutes.register:
        return _pageRoute(const RegisterScreen());
      case AppRoutes.main:
        {
          return CupertinoPageRoute(builder: (context) => MainLayout());
        }
      case AppRoutes.updateProfile:
        {
          return CupertinoPageRoute(builder: (context) => UpdateProfile());
        }
      case AppRoutes.forgetPassword:
         return _pageRoute(ForgetPasswordScreen());
  

    case AppRoutes.browse:
  final genre = settings.arguments as String?; 
  return CupertinoPageRoute(
    builder: (_) => BlocProvider(
      create: (_) => sl<BrowseBloc>()..add(LoadMovieEvent()),
      child: Browse(selectedGenre: genre, showBackButton: true,), 
    ),
  );

      default:
        return _pageRoute(LoginScreen());
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
