import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/appbar_common.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/common_button.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/icons.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/kelas_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/presentation/bloc/home_page_teacher_bloc.dart';

import '../../../../core/themes/textstyle.dart';
class KelasFilterContainer extends StatefulWidget {
  final List<KelasEntities> listKelas;
  String selectedKelas;
  void Function(String?)? onChanged;

  KelasFilterContainer({super.key, required this.listKelas,required this.selectedKelas,required this.onChanged });

  @override
  State<KelasFilterContainer> createState() => _KelasFilterContainerState();
}

class _KelasFilterContainerState extends State<KelasFilterContainer> {


void toggleSelectedKelas (String kelas){
  setState(() {
    if(widget.selectedKelas == kelas){
      widget.selectedKelas = '';
      return;
    }else{
      widget.selectedKelas = kelas;
    }
  });
}
void toggleClear(){
  setState(() {
    widget.selectedKelas = '';
  });
}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              height: 5,
              width: 50,
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pilih Kelas',textAlign: TextAlign.start,style: txtHeading20Black,),
              InkWell(
                onTap: () {
                  toggleClear();
                },
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white, // Material color
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      'Clear',
                      textAlign: TextAlign.start,
                      style: txtRegularBlack, // Ensure this is defined elsewhere
                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 25,),
          Container(
            height: screenHeight / 4.6,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final kelas = widget.listKelas[index];
                  return InkWell(
                    onTap: () {
                      toggleSelectedKelas(kelas.namaKelas);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: widget.selectedKelas == kelas.namaKelas? ColorsResources.selectedColor: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color:widget.selectedKelas == kelas.namaKelas? ColorsResources.primaryButton :Colors.grey)
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(IconsThemes.iconKelas,color:widget.selectedKelas == kelas.namaKelas? ColorsResources.primaryButton : Colors.grey,width: 20,height: 20,),
                              SizedBox(width: 10,),
                              Text(kelas.namaKelas,style:widget.selectedKelas == kelas.namaKelas? txtSelected : txtDescriptionBold,),
                            ],
                          ),
                          Visibility(
                            visible: widget.selectedKelas == kelas.namaKelas,
                              child: Icon(Icons.check_circle_rounded,color: ColorsResources.primaryButton,))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10,);
                },
                itemCount: widget.listKelas.length
            ),
          ),
          CommonButton(text: 'Konfirmasi',
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                widget.onChanged!(widget.selectedKelas);
                context.pop();
              },haveRequirement: false)
        ],
      ),
    );
  }
}

