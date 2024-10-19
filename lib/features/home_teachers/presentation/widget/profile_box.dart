import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/shimmer/profile_box_shimmer.dart';

import '../../../../core/themes/images.dart';
import '../../../../core/themes/textstyle.dart';
import '../bloc/home_page_teacher_bloc.dart';
class ProfileBox extends StatelessWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: BlocBuilder<HomePageTeacherBloc,HomePageTeacherState>(
        builder: (BuildContext context, HomePageTeacherState state) {
          if(state is HomePageTeacherLoad){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(60, 0, 0, 0),
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              spreadRadius: 0
                          )
                        ],
                        shape: BoxShape.circle
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: state is HomePageTeacherLoad ? (state.image == '' || state.image == null ? Image.asset(Images.imageExample,fit: BoxFit.cover,height: 80,)
                          : Image.network(state.image ?? '')) : Image.asset(Images.imageExample,fit: BoxFit.cover,height: 80,) ,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Selamat Datang 👋", style: txtRegularBlack),
                      SizedBox(height: screenHeight * 0.003,),
                      Text(state is HomePageTeacherLoad ? state.name : '', style: txtRegularBlack),
                    ],
                  ),
                ],
              ),
              Icon(Icons.notifications_outlined)
            ],
          );
          }else{
            return ProfileBoxShimmer();
          }
        },
      ),
    );
  }
}
