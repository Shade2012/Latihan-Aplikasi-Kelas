import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/forgotpassword/presentation/bloc/forgot_password_bloc.dart';
import '../../../../common/appbar_common.dart';
import '../../../../common/common_button.dart';
import '../../../../core/error/snackbar_error.dart';
import '../../../../core/themes/textstyle.dart';
import '../../../login/presentation/widget/textformfield_widget.dart';
class ForgotPasswordThirdPage extends StatefulWidget {
  const ForgotPasswordThirdPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordThirdPage> createState() => _ForgotPasswordThirdPageState();
}

class _ForgotPasswordThirdPageState extends State<ForgotPasswordThirdPage> {
  final formkey= GlobalKey<FormState>();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obsecureText = true;
  bool _obsecureText2 = true;
  bool requirementComplete = false;

  String? validatePasswordConfirmation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value != _passwordController.text) {
      return 'Password Tidak Sama';
    }
    return null;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
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
            listener: (context, state) {
              if(state is ForgotPasswordSuccess){
                context.pushNamed('login_page');
                return;
              }if(state is ForgotPasswordFailure){
                SnackBarError.showError(context,state.error);
                return;
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Buat Kata Sandi Baru',style: txtHeading,),
                    const SizedBox(height: 10,),
                    Text('Masukkan kata sandi baru Anda di bawah dan Pastikan itu berbeda dari sebelumnya!',style: txtDescriptionBold,textAlign: TextAlign.center,),
                    const SizedBox(height: 30,),
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Form(child: Column(
                              children: [
                                CustomTextFormField(type: TextInputType.text,title: 'Password' ,hint: 'Masukkan Password Baru', obsecureText: _obsecureText,controller: _passwordController, validatorID:0),
                                const SizedBox(height: 10,),
                                CustomTextFormField(type: TextInputType.text,title: 'Konfirmasi Password' ,hint: 'Masukkan Kembali Password', obsecureText: _obsecureText2,controller: _confirmPasswordController, validatorID: 0,validator: validatePasswordConfirmation,),
                                CommonButton(text: 'Perbarui Password',height: screenHeight * 0.06 ,
                                  isLoading: state is ForgotPasswordLoading,
                                  onPressed: () {
                                  context.read<ForgotPasswordBloc>().add(ForgotPasswordLastPageEvent(password: _passwordController.text, confirmPassword: _confirmPasswordController.text));

                                  }, haveRequirement: true,requirementComplete:  _passwordController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty && formkey.currentState!.validate() ,)
                              ],
                            )
                            ),
                          ],
                        )),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            },
          )
      )
      ),
    );
  }
}
