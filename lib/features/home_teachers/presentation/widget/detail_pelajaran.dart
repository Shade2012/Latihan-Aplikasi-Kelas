import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/lecture_entities.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/images.dart';

Future<dynamic> DetailPelajaran(context, Lecture schedule,String image) {
  double screenHeight = MediaQuery.of(context).size.height;
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(15),
        height: screenHeight / 2.5,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              height: 5,
              width: 50,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 8,
                    color: Color.fromARGB(60, 0, 0, 0),
                    spreadRadius: 1
                  )
                ],
                  color: ColorsResources.primaryButton,
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  schedule.namaPelajaran,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!)),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width:30,
                    height: 30,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(60, 0, 0, 0),
                              offset: Offset(1, 1),
                              spreadRadius: 0
                          )
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: image == '' ? Image.asset(Images.imageExample,fit: BoxFit.cover,width: 30,height: 30,) : Image.network(image ?? ''),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              schedule.guru,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Pengajar",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              schedule.kelas,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Kelas",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hari",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        schedule.hari,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Durasi mengajar",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "${schedule.jamMulai} - ${schedule.jamSelesai}",
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Materi",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        schedule.namaPelajaran,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Ruangan",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        schedule.ruang,
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
