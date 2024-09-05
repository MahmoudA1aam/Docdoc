import 'package:docdoc_app/core/routing/route_names.dart';
import 'package:docdoc_app/features/login/ui/login_screen.dart';
import 'package:docdoc_app/features/onBoarding/onBoarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
 static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => Onboardingscreen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen(),);
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(
                body: Center(
                  child: Text("No route defined for${settings.name}"),
                ),
              ),
        );
    }
  }
}
