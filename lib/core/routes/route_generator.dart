
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/main/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class RoutesManager {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        {
          return CupertinoPageRoute(
            builder: (context) => MainLayout());
        }

    }
    return null;
  }
}
