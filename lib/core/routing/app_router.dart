import 'package:docdoc_app/core/di/dependency_injection.dart';
import 'package:docdoc_app/core/routing/route_names.dart';
import 'package:docdoc_app/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:docdoc_app/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:docdoc_app/features/home_screen/cubit/home_cubit.dart';
import 'package:docdoc_app/features/home_screen/ui/home_screen.dart';

import 'package:docdoc_app/features/onBoarding/onBoarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/cubit/login_cubit.dart';
import '../../features/auth/login/ui/login_screen.dart';

class AppRouter {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const Onboardingscreen(),
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen()),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getSpecializationData(),
            child: const HomeScreen(),
          ),
        );
      case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defined for${settings.name}"),
            ),
          ),
        );
    }
  }
}
