import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/profile_teachers_entities.dart';
import '../../domain/usecases/get_profile.dart';
import 'profile_teachers_event.dart';
import 'profile_teachers_state.dart';

class ProfileTeachersBloc
    extends Bloc<ProfileTeachersEvent, ProfileTeachersState> {
  ProfileTeachersBloc({
    required GetProfileUseCase getProfileUseCase,
  })  : _getProfileUseCase = getProfileUseCase,
        super(ProfileTeachersInitial()) {
    on<LoadProfileTeachers>(_getProfileData);
  }

  final GetProfileUseCase _getProfileUseCase;
  Future<void> _getProfileData(
    LoadProfileTeachers event,
    Emitter<ProfileTeachersState> emit,
  ) async {
    emit(ProfileTeachersLoading());
    Either<Failure, ProfileTeachersEntities> result =
        await _getProfileUseCase.execute();
    result.fold(
      (failure) => emit(ProfileTeachersError(failure: failure)),
      (profile) => emit(ProfileTeachersLoaded(profile: profile)),
    );
  }
}
