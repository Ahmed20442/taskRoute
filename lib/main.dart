import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'core/myobserver.dart';
import 'myapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  configureDependencies();
   runApp(  MyApp());
}
