import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/aboutteacher/bloc/about_teacher_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/aboutteacher/bloc/about_teacher_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/aboutteacher/bloc/about_teacher_state.dart';
import 'package:google_fonts/google_fonts.dart'; 

class AboutTeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutTeacherBloc()..add(LoadAboutTeacherEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              context.go('/navbar');
            },
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 20,
              ),
            ),
            iconSize: 20,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<AboutTeacherBloc, AboutTeacherState>(
            builder: (context, state) {
              if (state is AboutTeacherInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is LoadAboutTeacher) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      Text(
                        'Tentang Kami',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(color: Colors.grey[400]), // Line separator

                      // Paragraph Section
                      const SizedBox(height: 20), // Add spacing before paragraph
                      Text(
                        'SekolahKu adalah aplikasi pembelajaran yang dirancang untuk memudahkan proses belajar mengajar bagi siswa dan guru. '
                        'Kami percaya bahwa teknologi dapat menjadi jembatan yang efektif dalam menciptakan pengalaman belajar yang lebih mudah, '
                        'efisien, dan menyenangkan.\n\n'
                        'Dengan SekolahKu, kami berkomitmen untuk menghadirkan platform yang intuitif dan ramah pengguna, sehingga siswa dapat fokus '
                        'pada materi pembelajaran tanpa terhambat oleh kendala teknis. Aplikasi ini menyediakan berbagai fitur yang dirancang khusus '
                        'untuk mendukung kegiatan belajar, dari akses materi, tugas, hingga interaksi dengan guru.\n',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                            height: 1.7,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Space before team section

                      // Team Section Header
                      Text(
                        'Dibangun oleh tim yang berdedikasi:',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Small spacing before the list
                      
                      // Team Section
                      Text(
                        'Zidan (Backend)\n'
                        'Damar (Fullstack)\n'
                        'Calvin (Backend)\n'
                        'Faris (Frontend)\n'
                        'Marlen (Frontend)\n'
                        'Abid (Frontend)\n'
                        'Rafiano (Frontend)\n',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // Space before the closing section

                      // Closing Paragraph
                      Divider(color: Colors.grey[400]), // Another line separator
                      const SizedBox(height: 20), // Space after line
                      Text(
                        'SekolahKu hadir untuk mendukung setiap siswa agar dapat belajar lebih baik di mana pun dan kapan pun.',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                            height: 1.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
