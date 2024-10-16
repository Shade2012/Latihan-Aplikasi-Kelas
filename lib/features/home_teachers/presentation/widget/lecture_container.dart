import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/icons.dart';
import '../../../../core/themes/textstyle.dart';

Widget LectureContainerSecond({
  String? time,
  String? subject,
  String? teacher,
  String? room,
  String? day,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 65,
          child: Text(
            "$time",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 3, left: 3, bottom: 5),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey[500]!, width: 1),
                top: BorderSide(color: Colors.grey[500]!, width: 1),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                  color: ColorsResources.primaryButton,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$subject",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(children: [
                    SvgPicture.asset(IconsThemes.iconTeacherIcon,color: Colors.white,height: 20,width: 20,),
                    const SizedBox(width: 5),
                    Text(
                      "$teacher",
                      style: txtWhiteNormal,
                    )
                  ]),
                  const SizedBox(height: 8),
                  Row(children: [
                    SvgPicture.asset(IconsThemes.iconLocationTeach,color: Colors.white,height: 20,width: 20,),
                    const SizedBox(width: 5),
                    Text(
                      "$room",
                      style: txtWhiteNormal
                    )
                  ]),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
