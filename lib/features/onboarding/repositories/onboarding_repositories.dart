import 'package:latihan_aplikasi_manajemen_kelas/features/onboarding/models/onboarding_models.dart';

class OnboardingRepository {
  Future<List<OnboardingModel>> fetchOnboardingSlides() async {
    await Future.delayed(Duration(seconds: 2));
    return onboardingSlides;
  }
}
