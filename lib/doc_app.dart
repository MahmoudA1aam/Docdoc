import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:docdoc_app/core/routing/route_names.dart';
import 'package:docdoc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(300, 500),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Doc App",
        initialRoute: RouteNames.onBoardingScreen,
        onGenerateRoute: AppRouter.onGeneratedRoute,
        theme: ThemeData(
          primaryColor: ColorsApp.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
