import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/router/app_router.dart';
import 'package:fruits_hub_dashbord/core/services/bloc_observer.dart';
import 'package:fruits_hub_dashbord/core/services/get_it_sevice.dart';
import 'package:fruits_hub_dashbord/core/utils/end_points.dart';
import 'package:fruits_hub_dashbord/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(url: AppKeys.url, anonKey: AppKeys.anonKey);
//  await SupabaseStorageService.createBuckets(EndPoints.images);
  Bloc.observer = AppBlocObserver();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
