import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/error/snackbar_error.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/bloc/forgot_password_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/bloc/login_page_bloc.dart';

import '../../../../common/appbar_common.dart';
import '../../../../common/common_button.dart';
import '../../../../core/themes/textstyle.dart';
import '../../../login/presentation/widget/textformfield_widget.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formkey= GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool requirementComplete = false;


  void checkRequirements() {
    if(_emailController.text.isNotEmpty &&
        formkey.currentState!.validate()){
      setState(() {
        requirementComplete = true;
      });
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.08),
          child: AppbarCommon()),
      body: SingleChildScrollView(
          child: BlocConsumer<ForgotPasswordBloc,ForgotPasswordState>(
            builder: (context, state) {
              return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Forgot Password',style: txtHeading,),
                        const SizedBox(height: 10,),
                        Text('Masukkan Email Untuk Reset Password',style: txtDescriptionBold,),
                        const SizedBox(height: 30,),
                        Form(
                            key: formkey,
                            child: Column(
                              children: [
                                CustomTextFormField(onChanged: (value) => checkRequirements(),type: TextInputType.emailAddress,title: 'Email' ,hint: 'Masukkan Email', obsecureText: false, controller: _emailController, validatorID: 1),
                                const SizedBox(height: 10,),
                                CommonButton(text: 'Lanjutkan',height: screenHeight * 0.06 ,isLoading: state is ForgotPasswordLoading,onPressed: () {
                                  context.read<ForgotPasswordBloc>().add(ForgotPasswordSendOtpEvent(email: _emailController.text));
                                }, haveRequirement: true,requirementComplete: _emailController.text.isNotEmpty && formkey.currentState!.validate(),)
                              ],
                            )),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  )
              );
            },
            listener: (context, state) {
              if(state is ForgotPasswordSuccess){
                context.pushNamed('forgot_second_page');
                return;
              }if(state is ForgotPasswordFailure){
                SnackBarError.showError(context,state.error);
              }
            },
          )
      ),
    );
  }
}
