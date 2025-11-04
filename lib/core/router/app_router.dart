
import 'package:fruits_hub_dashbord/core/router/app_routes.dart';
import 'package:fruits_hub_dashbord/core/router/app_transitions.dart';
import 'package:fruits_hub_dashbord/features/dashbord/views/dashbord_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.dashbord,

    routes: [
      // ----------------------- Public routes (no bottom nav) -----------------------
      // GoRoute(
      //   path: AppRoutes.splash,
      //   name: AppRoutes.splash,
      //   pageBuilder: (context, state) => AppTransitions.size(
      //     context: context,
      //     state: state,
      //     child: const SplashView(),
      //   ),
      //),
      GoRoute(
        path: AppRoutes.dashbord,
        name: AppRoutes.dashbord,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: const DashboardView(),
        ),
    
        
      ),
    ],
  );
}
