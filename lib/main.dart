import 'package:docdoc_app/core/routing/app_router.dart';

import 'package:docdoc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injection.dart';
import 'core/helper/myBlocObserver.dart';

void main() {
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(DocApp(appRouter: AppRouter()));
}
