part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class SpecializatonLoadingState extends HomeState {}

class SpecializatonSuccessState extends HomeState {
  List<SpecialzationsData>? specialzationsDataList;

  SpecializatonSuccessState({required this.specialzationsDataList});
}

class SpecializatonErrorState extends HomeState {
  ApiErrorModel? errorMassege;

  SpecializatonErrorState({this.errorMassege});
}

class DoctorsSuccessState extends HomeState {
  List<Doctors>? doctorsList;

  DoctorsSuccessState({this.doctorsList});
}

class DoctorsErrorState extends HomeState {
  ApiErrorModel? errorMassege;

  DoctorsErrorState({this.errorMassege});
}
