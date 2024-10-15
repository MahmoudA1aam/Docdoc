import 'package:docdoc_app/core/theming/colors.dart';
import 'package:docdoc_app/features/home_screen/cubit/home_cubit.dart';
import 'package:docdoc_app/features/home_screen/widgets/bloc_builder_list_speciality.dart';
import 'package:docdoc_app/features/home_screen/widgets/row_tittle_and_buttom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/bloc_builder_recommended_doctors.dart';
import '../widgets/doctors_blue_container.dart';
import '../widgets/home_appBar_wiget.dart';
import '../widgets/list_view_doctor-_speciality.dart';
import '../widgets/listview_recomendation_doctor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const HomeAppbarWiget(),
              const DoctorsBlueContainer(),
              SizedBox(
                height: 20.h,
              ),
              const RowTittleAndButtomText(
                title: "Doctor Speciality",
              ),
              SizedBox(
                height: 10.h,
              ),
              const BlocBuilderListSpeciality(),
              const BlocBuilderRecommendedDoctors()
            ],
          ),
        ),
      ),
    );
  }
}
