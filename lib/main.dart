import 'package:final_route_projcet_c16/core/cashe/cashe_helper.dart';
import 'package:final_route_projcet_c16/core/di/di.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_bloc.dart';
import 'package:final_route_projcet_c16/features/main/profile/presentation/view_model/history/history_bloc.dart';
import 'package:final_route_projcet_c16/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<FavoriteBloc>()),
        BlocProvider(create: (_) => sl<HistoryBloc>()),
      ],
      child: Movies(),
    ),
  );
}
