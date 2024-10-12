import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/appbar_common.dart';
import '../../../../common/common_button.dart';
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
          child: Padding(
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
                              onPressed: () {
                                context.pushNamed('login_page');
                    }, haveRequirement: true,requirementComplete:  _passwordController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty && formkey.currentState!.validate() ,)
                          ],
                        )
                        ),
                      ],
                    )),
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
