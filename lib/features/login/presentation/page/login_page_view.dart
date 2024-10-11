import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/common_button.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/routes/my_route.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/textstyle.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/bloc/login_page_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/widget/google_button.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/widget/textformfield_widget.dart';

import '../../../../common/appbar_common.dart';
class LoginPageView extends StatefulWidget {

  LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final formkey= GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obsecureText = true;
  bool requirementComplete = false;


  void checkRequirements() {
    if(_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
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
    _passwordController.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login',style: txtHeading,),
                    const SizedBox(height: 10,),
                    Text('Masukkan Email dan Password',style: txtDescriptionBold,),
                    const SizedBox(height: 30,),
                    Form(
                      key: formkey,
                        child: Column(
                      children: [
                        CustomTextFormField(onChanged: (value) => checkRequirements(),type: TextInputType.emailAddress,title: 'Email' ,hint: 'Masukkan Email', obsecureText: false, controller: _emailController, validatorID: 1),
                        const SizedBox(height: 10,),
                        CustomTextFormField(onChanged: (value) => checkRequirements(),type: TextInputType.text,title: 'Password' ,hint: 'Masukkan Password', obsecureText: true,toggleObscureText:  togglePasswordVisibility,controller: _passwordController, validatorID:0),
                        SizedBox(width: double.infinity,child: InkWell(onTap: () {
                          context.pushNamed('forgot_page');
                        },

                          child: Text('Lupa Password?',textAlign: TextAlign.end,)
                        ),),
                        const SizedBox(height: 20,),
                        CommonButton(text: 'Login',height: screenHeight * 0.06 ,onPressed: () {
                        }, haveRequirement: true,requirementComplete: (_emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) &&
                            (formkey.currentState!.validate()),
                        )
                      ],
                    )),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Expanded(child: Divider(color: Colors.grey,)),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 5),child: Text('Atau',style: txtLightGrey,),),
                          const Expanded(child: Divider(color: Colors.grey,))
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GoogleButton(OnPressed: () {

                    },)
                  ],
                ),
              )
          )
      ),
    );
  }
}
