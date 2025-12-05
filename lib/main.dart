import 'package:final_route_projcet_c16/movies.dart';
import 'package:final_route_projcet_c16/core/services/session_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionService.init();
  runApp(const Movies());
}


