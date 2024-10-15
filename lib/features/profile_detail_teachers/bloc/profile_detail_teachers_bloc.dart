import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_detail_teachers/bloc/profile_detail_teachers_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_detail_teachers/bloc/profile_detail_teachers_state.dart';

class DetailProfileBloc extends Bloc<DetailProfileEvent, DetailProfileTeachersState> {
  DetailProfileBloc() : super(ProfileTeachersInitialState()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfileEvent event, Emitter<DetailProfileTeachersState> emit) async {
    emit(ProfileTeachersLoadingState());
    try {
      // Simulate API call or database query to fetch profile data
      await Future.delayed(const Duration(seconds: 2));

      // Example profile data
      final profileTeachersData = {
        "name": "Ajar Abu Hairoh",
        "role": "Guru",
        "email": "AjarAH@gmail.com",
      };

      emit(ProfileTeachersLoadedState(profileTeachersData));
    } catch (error) {
      emit(ProfileTeachersErrorState("something went wrong"));
    }
  }

  Future<void> _onUpdateProfile(
      UpdateProfileEvent event, Emitter<DetailProfileTeachersState> emit) async {
    emit(ProfileTeachersLoadingState());
    try {
      // Simulate API call or database query to update profile data
      await Future.delayed(const Duration(seconds: 1));

      // Example: updating profile data
      final updatedProfileData = {
        "name": event.updatedData["name"] ?? "John Doe",
        "email": event.updatedData["email"] ?? "johndoe@example.com",
        "bio": event.updatedData["bio"] ?? "Software Engineer"
      };

      emit(ProfileTeachersLoadedState(updatedProfileData));
    } catch (error) {
      emit(ProfileTeachersErrorState('Failed to update profile'));
    }
  }
}
