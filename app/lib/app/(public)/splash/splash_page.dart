import 'package:coopartilhar/app/(public)/splash/splash_page_animation.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPageAnimation(
        onAnimationCompleted: () {
          Routefly.navigate(
            routePaths.auth.login,
          );
        },
      ),
    );
  }
}
