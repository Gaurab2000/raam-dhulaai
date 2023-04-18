import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:raam_dhulaai/firebase_options.dart';
import 'package:raam_dhulaai/src/app/views/views.dart';
import 'package:raam_dhulaai/src/core/routes/app_router.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.registerLazySingleton(AppRouter.new);
  await dotenv.load(fileName: '.env');
  runApp(AppView.new());
}
