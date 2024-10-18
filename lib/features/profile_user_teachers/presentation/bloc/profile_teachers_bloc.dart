import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_teachers_event.dart';
import 'profile_teachers_state.dart';
import '../repositories/profile_teachers_repositories.dart';

class ProfileTeachersBloc
    extends Bloc<ProfileTeachersEvent, ProfileTeachersState> {
  final ProfileTeachersRepository profileRepository;

  ProfileTeachersBloc({required this.profileRepository})
      : super(ProfileTeachersInitial()) {
    on<LoadProfileTeachers>((event, emit) async {
      emit(ProfileTeachersLoading());
      try {
        final profile = await profileRepository.fetchProfileTeachers();
        emit(ProfileTeachersLoaded(profile: profile));
      } on Exception catch (e) {
        emit(ProfileTeachersError(message: e.toString()));
      }
    });
  }
}
