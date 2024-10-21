import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/shimmer_common.dart';
import '../../../../core/themes/colors.dart';
import '../bloc/profile_teachers_bloc.dart';
import '../bloc/profile_teachers_state.dart';

class TeachersProfileWidget extends StatelessWidget {
  const TeachersProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double profileSize = 100;
    String imageUrl = 'assets/images/pfpimg.jpg';

    return BlocBuilder<ProfileTeachersBloc, ProfileTeachersState>(
      builder: (context, state) {
        if (state is ProfileTeachersLoading) {
          return _buildLoadingProfile(context);
        }
        if(state is ProfileTeachersLoaded){
        }
        return Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.2,
                      color: const Color(0xFF62C0A1),
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.08,
                      color: Colors.white,
                    ),
                  ],
                ),
                Positioned(
                  top: screenHeight * 0.15,
                  left: screenWidth * 0.5 - 50,
                  right: screenWidth * 0.5 - 50,
                  child: Container(
                    width: profileSize,
                    height: profileSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: state is ProfileTeachersLoaded ?
                      (state.profile.image == null || state.profile.image!.isEmpty || state.profile.image == '{}'  ?
        (Image.asset(imageUrl,fit: BoxFit.cover,)): Image.network(state.profile.image ?? '')) : Image.asset(imageUrl,fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              state is ProfileTeachersLoaded
                  ? state.profile.name
                  : 'Loading...',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              state is ProfileTeachersLoaded
                  ? state.profile.role
                  : 'Loading...',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorsResources.primaryButton),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}

Widget _buildLoadingProfile(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Column(
    children: [
      Stack(
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.2,
                color: const Color(0xFF62C0A1),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.08,
                color: Colors.white,
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.5 - 50,
            right: screenWidth * 0.5 - 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const ClipOval(
                child: ShimmerCommon(
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ],
      ),
      ShimmerCommon(
        width: screenWidth / 4,
        height: 22,
        radius: 8,
      ),
      const SizedBox(height: 5),
      ShimmerCommon(
        width: screenWidth / 5.5,
        height: 20,
        radius: 8,
      ),
    ],
  );
}
