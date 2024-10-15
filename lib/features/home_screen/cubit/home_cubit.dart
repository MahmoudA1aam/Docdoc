import 'package:bloc/bloc.dart';
import 'package:docdoc_app/core/api_helper/api_error_handler.dart';
import 'package:docdoc_app/core/helper/constants.dart';
import 'package:docdoc_app/core/helper/shared_perf_helper.dart';
import 'package:meta/meta.dart';

import '../../../core/api_helper/api_error_model.dart';
import '../../../data/home_screen/models/specialzations_response_model.dart';
import '../../../data/home_screen/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitialState());
  final HomeRepo homeRepo;
  List<SpecialzationsData>? specialzationsData = [];
  void getSpecializationData() async {
    emit(SpecializatonLoadingState());

    final response = await homeRepo.getSpecialization();
    response.when(
      success: (response) {
        specialzationsData = response.specialzationsDataList ?? [];
        getDoctorsList(SpcializationId: specialzationsData?.first.id);
        emit(SpecializatonSuccessState(
            specialzationsDataList: specialzationsData));
      },
      failure: (error) {
        emit(SpecializatonErrorState(errorMassege: error));
      },
    );
  }

  void getDoctorsList({required int? SpcializationId}) {
    List<Doctors> doctorsList =
        filterSpecializationListById(specializationId: SpcializationId);
    if (doctorsList != null && doctorsList.isNotEmpty) {
      emit(DoctorsSuccessState(doctorsList: doctorsList));
    } else {
      emit(DoctorsErrorState(
          errorMassege: ApiErrorHandler.handle("No doctors found")));
    }
  }

  filterSpecializationListById({required int? specializationId}) {
    return specialzationsData!
        .firstWhere(
          (element) => element.id == specializationId,
        )
        .doctorsList;
  }
}
