import 'package:go_router/go_router.dart';
import 'package:imdb_clone/app/navigation/app_route.dart';
import 'package:imdb_clone/app/ui/screens/splash/splash_screen.dart';
import 'package:imdb_clone/app/ui/screens/splash/splash_screen_view_model.dart';

class AppRouterConfig {
  late final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: AppRoute.root,
  );

  void dispose() {}

  late final _routes = <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.root,
      builder: (context, state) {
        return SplashScreen(
          viewModel: SplashScreenViewModel(),
        );
      },
    ),
  ];
}
