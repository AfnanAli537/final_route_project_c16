import 'package:final_route_projcet_c16/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); 
  runApp(const Movies());
}


