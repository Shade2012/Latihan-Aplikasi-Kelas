class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

List<OnboardingModel> onboardingSlides = [
  OnboardingModel(
    title: "Pengelolaan Jadwal yang Mudah",
    description: "Guru dan siswa dapat dengan mudah melihat jadwal harian atau mingguan mereka. Kelola jadwal mengajar atau belajar dengan efisien hanya dalam beberapa langkah.",
    imagePath: "assets/images/onboarding1.png",
  ),
  OnboardingModel(
    title: "Informasi Jadwal Lengkap",
    description: "Dapatkan informasi lengkap tentang jadwal dengan detail hari, jam, mata pelajaran, guru, kelas, dan ruang kelas. Pastikan tidak ada sesi yang terlewatkan.",
    imagePath: "assets/images/onboarding2.png",
  ),
  OnboardingModel(
    title: "Pengingat Pelajaran Tepat Waktu",
    description: "Dapatkan notifikasi pengingat sebelum pelajaran dimulai, membantu siswa dan guru tetap tepat waktu dan siap menghadapi setiap sesi.",
    imagePath: "assets/images/onboarding3.png",
  ),
];
