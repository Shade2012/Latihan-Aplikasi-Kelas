import 'package:flutter/material.dart';

import '../../../../core/themes/images.dart';
import '../../../../core/themes/textstyle.dart';
class GoogleButton extends StatelessWidget {
  final VoidCallback OnPressed;
  const GoogleButton({Key? key, required this.OnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black)
      ),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 10)
        ,child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.logoGoogle),
            Text('Login dengan Google',style: txtLightGrey,)
          ],
        ),),
    );
  }
}
