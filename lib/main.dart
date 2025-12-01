import 'package:final_route_projcet_c16/core/di/di.dart';
import 'package:final_route_projcet_c16/movies.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const Movies());
}


