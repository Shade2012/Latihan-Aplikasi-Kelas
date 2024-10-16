import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/pelajaran_entities.dart';
import '../bloc/home_page_teacher_bloc.dart';
import '../shimmer/dropdown_shimmer.dart';
class DropdownFilterMataPelajaran extends StatelessWidget {
  String selectedPelajaran;
  void Function(String?)? onChanged;
  DropdownFilterMataPelajaran({required this.selectedPelajaran,this.onChanged,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 8,
            color: Color.fromARGB(60, 0, 0, 0),
          )
        ]
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: BlocBuilder<HomePageTeacherBloc,HomePageTeacherState>(
        builder: (context, state) {
          if(state is HomePageTeacherLoad){
            List<PelajaranEntities> pelajaranEntities = state.pelajaranEntities;
            List<String> namaPelajaranList = pelajaranEntities.map((element) => element.namaPelajaran).toList();
            if (pelajaranEntities.isEmpty) {
              return Center(
                child: Text('No Kelas available'),
              );
            }
            return CustomDropdown<String>(

              hintText: 'Filter Mata Pelajaran',
              items: namaPelajaranList,
              initialItem: pelajaranEntities.firstWhere((element) => element.namaPelajaran == selectedPelajaran,).namaPelajaran,
              onChanged: onChanged
            );
          }else{
            return Center(
              child: state is HomePageTeacherLoading
                  ? DropdownShimmer()
                  : DropdownShimmer(),
            );
          }

        },
      ),
    );
  }
}
