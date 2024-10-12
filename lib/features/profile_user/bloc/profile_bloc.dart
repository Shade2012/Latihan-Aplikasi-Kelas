import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/repositories/profile_repositories.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await profileRepository.fetchProfile();
        emit(ProfileLoaded(profile: profile));
      } catch (e) {
        emit(ProfileError(message: e.toString()));
      }
    });
  }
}
