import 'package:flutter/material.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/textstyle.dart';

class DayContainerTeachers extends StatelessWidget {
  final String day;
  int value;
  int groupValue;
  void Function(int?)? onChanged;
   DayContainerTeachers({required this.value,required this.groupValue,required this.onChanged,required this.day,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isActive = value == groupValue;
    return Container(
      margin: EdgeInsets.all(2),
      child: Material(
        elevation: 2,
        color: isActive ? ColorsResources.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(80),
        child: InkWell(
          borderRadius: BorderRadius.circular(80),
          onTap: () {
            groupValue = value;
            onChanged!(value);
          },
          child: SizedBox(
            width: 60,
            child: Center(child: Text(day.substring(0,3),style: isActive ? txtWhiteMedium : txtRegularBlack,overflow: TextOverflow.visible,),),
          ),
        ),
      ),
    );
  }
}
