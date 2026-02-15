
import 'package:fruits_hub_dashbord/core/router/app_routes.dart';
import 'package:fruits_hub_dashbord/core/router/app_transitions.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/views/add_data_view.dart';
import 'package:fruits_hub_dashbord/features/dashbord/views/dashbord_view.dart';
import 'package:fruits_hub_dashbord/features/orders/presentation/views/order_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.dashbord,

    routes: [
     
      GoRoute(
        path: AppRoutes.dashbord,
        name: AppRoutes.dashbord,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: const DashboardView(),
        ),),
         GoRoute(
        path: AppRoutes.addData,
        name: AppRoutes.addData,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: const AddDataView(),
        ),
      
        
      ),
       GoRoute(
        path: AppRoutes.viewOrders,
        name: AppRoutes.viewOrders,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: const OrderView(),
        ),
      
        
      ),
    ],
  );
}
