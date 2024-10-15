import 'package:bot_toast/bot_toast.dart';
import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:docdoc_app/core/routing/route_names.dart';
import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/main_development.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/constants.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Doc App",
        initialRoute:
            isLoggedInUser ? RouteNames.homeScreen : RouteNames.loginScreen,
        onGenerateRoute: AppRouter.onGeneratedRoute,
        theme: ThemeData(
          primaryColor: ColorsApp.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        builder: EasyLoading.init(builder: BotToastInit()),
      ),
    );
  }
}
