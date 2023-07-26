import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:imdb_clone/app/navigation/app_route.dart';

class SplashScreenViewModel {
  void gotoMainScreen(BuildContext context) {
    context.goNamed(AppRoute.main);
  }
}
