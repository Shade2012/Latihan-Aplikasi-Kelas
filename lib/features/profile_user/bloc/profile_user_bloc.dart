import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/domain/usecase/get_profile_user.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/profile_user/bloc/profile_user_state.dart';

class ProfileUserBloc extends Bloc<ProfileUserEvent, ProfileUserState> {
  final GetProfileUserUseCase getProfileUserUseCase;

  ProfileUserBloc({required this.getProfileUserUseCase}) : super(ProfileUserInitial()) {
    on<LoadProfileUser>(_onLoadProfileUser);
  }

  Future<void> _onLoadProfileUser(LoadProfileUser event, Emitter<ProfileUserState> emit) async {
    emit(ProfileUserLoading()); // Emit the loading state
    try {
      final profileUser = await getProfileUserUseCase.execute();
      emit(ProfileUserLoaded(profileUser: profileUser)); // Emit the loaded state
    } catch (e) {
      emit(ProfileUserError(message: e.toString())); // Emit the error state
    }
  }
}
