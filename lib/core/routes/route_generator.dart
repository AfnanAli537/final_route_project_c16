import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view/browse.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view_model/bloc/browse_bloc.dart';
import 'package:final_route_projcet_c16/features/search/presentation/view/search.dart';
import 'package:final_route_projcet_c16/features/search/presentation/view_model/bloc/search_bloc.dart';
import 'package:final_route_projcet_c16/features/main/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/browser/presentation/view_model/bloc/browse_event.dart';
import '../di/di.dart';

abstract class RoutesManager {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
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
      case AppRoutes.browse:
        {
          return CupertinoPageRoute(
            builder: (_) =>
                BlocProvider(create: (_) =>
                sl<BrowseBloc>()..add(LoadMovieEvent()), child: Browse()),
          );
        }
    }
    return null;
  }
}
