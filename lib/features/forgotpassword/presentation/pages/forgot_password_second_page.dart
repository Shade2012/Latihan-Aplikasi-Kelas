import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/appbar_common.dart';
import '../../../../common/common_button.dart';
import '../../../../core/themes/textstyle.dart';
import '../../../login/presentation/widget/textformfield_widget.dart';
import '../widget/otp_textfield.dart';
class ForgotPasswordSecondPage extends StatefulWidget {
  const ForgotPasswordSecondPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordSecondPage> createState() => _ForgotPasswordSecondPageState();
}

class _ForgotPasswordSecondPageState extends State<ForgotPasswordSecondPage> {
  final formkey= GlobalKey<FormState>();
  final TextEditingController _verificationCode1 = TextEditingController();
  final TextEditingController _verificationCode2 = TextEditingController();
  final TextEditingController _verificationCode3 = TextEditingController();
  final TextEditingController _verificationCode4 = TextEditingController();
  final TextEditingController _verificationCode5 = TextEditingController();
  bool requirementComplete = false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _verificationCode1.dispose();
    _verificationCode2.dispose();
    _verificationCode3.dispose();
    _verificationCode4.dispose();
    _verificationCode5.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.08),
          child: AppbarCommon()),
      body: SingleChildScrollView(child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Verifikasi Email',style: txtHeading,),
                const SizedBox(height: 10,),
                Text('Kami telah mengirimkan kode verifikasi ke alamat email Anda',style: txtDescriptionBold,),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    VerificationCodeInput(
                      key: const ValueKey("code1"),
                      controller: _verificationCode1,
                      index: 1,
                    ),
                    const SizedBox(width: 5,),
                    VerificationCodeInput(
                      key: const ValueKey("code2"),
                      controller: _verificationCode2,
                      index: 2,
                    ),
                    const SizedBox(width: 5,),
                    VerificationCodeInput(
                      key: const ValueKey("code3"),
                      controller: _verificationCode3,
                      index: 3,
                    ),
                    const SizedBox(width: 5,),
                    VerificationCodeInput(
                      key: const ValueKey("code4"),
                      controller: _verificationCode4,
                      index: 4,
                    ),
                    const SizedBox(width: 5,),
                    VerificationCodeInput(
                      key: const ValueKey("code5"),
                      controller: _verificationCode5,
                      index: 5,
                    ),
                  ],
                ),
                // CommonButton(text: 'Lanjutkan',height: screenHeight * 0.06 ,onPressed: () {
                //   context.pushNamed('forgot_second_page');
                // }, haveRequirement: true,requirementComplete: _emailController.text.isNotEmpty && formkey.currentState!.validate(),
                // ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum Mendapatkan kode email ? ',style:txtNormalGrey ,),
                    Text('Kirim Ulang',style: txtLink,),
                  ],
                )
              ],
            ),
          )
      )
      ),
    );
  }
}
