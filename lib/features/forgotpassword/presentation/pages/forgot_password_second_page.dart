import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/success/snackbar_success.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/bloc/forgot_password_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/appbar_common.dart';
import '../../../../common/common_button.dart';
import '../../../../core/error/snackbar_error.dart';
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
  final TextEditingController _verificationCode6 = TextEditingController();
  bool requirementComplete = false;

  void checkRequirement (){
    if(_verificationCode1.text.isNotEmpty && _verificationCode2.text.isNotEmpty && _verificationCode3.text.isNotEmpty && _verificationCode4.text.isNotEmpty && _verificationCode5.text.isNotEmpty  && _verificationCode6.text.isNotEmpty){
      setState(() {
        requirementComplete = true;
      });
      return;
    }
    requirementComplete = false;
  }

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
          child: BlocConsumer<ForgotPasswordBloc,ForgotPasswordState>(
            builder: (context, state) {
              return Padding(
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
                          onChanged: (value) => checkRequirement(),
                          key: const ValueKey("code1"),
                          controller: _verificationCode1,
                          index: 1,
                        ),
                        const SizedBox(width: 5,),
                        VerificationCodeInput(
                          onChanged: (value) => checkRequirement(),
                          key: const ValueKey("code2"),
                          controller: _verificationCode2,
                          index: 2,
                        ),
                        const SizedBox(width: 5,),
                        VerificationCodeInput(
                          onChanged: (value) => checkRequirement(),
                          key: const ValueKey("code3"),
                          controller: _verificationCode3,
                          index: 3,
                        ),
                        const SizedBox(width: 5,),
                        VerificationCodeInput(
                          onChanged: (value) => checkRequirement(),
                          key: const ValueKey("code4"),
                          controller: _verificationCode4,
                          index: 4,
                        ),
                        const SizedBox(width: 5,),
                        VerificationCodeInput(
                          onChanged: (value) => checkRequirement(),
                          key: const ValueKey("code5"),
                          controller: _verificationCode5,
                          index: 5,
                        ),
                        const SizedBox(width: 5,),
                        VerificationCodeInput(
                          onChanged: (value) => checkRequirement(),
                          key: const ValueKey("code6"),
                          controller: _verificationCode6,
                          index: 6,
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    CommonButton(text: 'Verifikasi',height: screenHeight * 0.06 ,
                      isLoading: state is ForgotPasswordLoading,
                      onPressed: () {
                      context.read<ForgotPasswordBloc>().add(ForgotPasswordVerifyOtpEvent(otp: '${_verificationCode1.text}${_verificationCode2.text}${_verificationCode3.text}${_verificationCode4.text}${_verificationCode5.text}${_verificationCode6.text}'));
                    }, haveRequirement: true,requirementComplete: requirementComplete,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Belum Mendapatkan kode email ? ',style:txtNormalGrey ,),
                        InkWell(onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          String? email = prefs.getString('email');
                          context.read<ForgotPasswordBloc>().add(ForgotPasswordResendOtpEmail(email: email ?? ''));
                        },child: Text('Kirim Ulang',style: txtLink,)),
                      ],
                    )
                  ],
                ),
              );
            },
            listener: (context, state) {
              if(state is ForgotPasswordSuccessSendOtp){
                SnackbarSuccess.showSuccess(context, 'Otp Berhasil Dikirim');
                return;
              }
              if(state is ForgotPasswordSuccess){
    context.pushNamed('forgot_third_page');
    return;
    }if(state is ForgotPasswordFailure){
    SnackBarError.showError(context,state.error);

              }
            },
          )
      )
      ),
    );
  }
}
