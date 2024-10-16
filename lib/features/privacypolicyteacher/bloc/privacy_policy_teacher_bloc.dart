import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/privacypolicyteacher/bloc/privacy_policy_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/privacypolicyteacher/bloc/privacy_policy_teacher_state.dart';

class PrivacyPolicyTeacherBloc
    extends Bloc<PrivacyPolicyTeacherEvent, PrivacyPolicyTeacherState> {
  PrivacyPolicyTeacherBloc() : super(PrivacyPolicyTeacherInital()) {
    on<LoadPrivacyPolicyTeacher>((event, emit) async {
      emit(PrivacyPolicyTeacherLoading());
    });
  }
}
