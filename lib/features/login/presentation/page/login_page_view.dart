import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/common_button.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/routes/my_route.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/textstyle.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/bloc/login_page_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/widget/google_button/google_button.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/widget/textformfield_widget.dart';

import '../../../../common/appbar_common.dart';
import '../../../../core/error/snackbar_error.dart';
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: BlocConsumer<LoginPageBloc,LoginPageState>(
            listener: (context, state) {
              if(state is LoginPageSuccess){
                context.pushNamed('splash');
              }else if (state is LoginPageFailure) {
                SnackBarError.showError(context, state.error);
              }
            },
            builder: (context, state) {
              return SafeArea(
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
                                CustomTextFormField(onChanged: (value) => checkRequirements(),type: TextInputType.text,title: 'Password' ,hint: 'Masukkan Password', obsecureText: _obsecureText,controller: _passwordController, validatorID:0),
                                SizedBox(width: double.infinity,child: InkWell(onTap: () {
                                  context.pushNamed('forgot_page');
                                },
                                    child: Text('Lupa Password?',textAlign: TextAlign.end,)
                                ),),
                                const SizedBox(height: 20,),
                                CommonButton(
                                  isLoading: state is LoginPageLoading,
                                  text: 'Login',height: screenHeight * 0.06 ,
                                  onPressed: () {
                                    context.read<LoginPageBloc>().add(
                                        LoginButtonPressed(email: _emailController.text, password: _passwordController.text)
                                    );
                                  },
                                  haveRequirement: true,
                                  requirementComplete: (_emailController.text.isNotEmpty &&
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
                        GoogleButton()
                      ],
                    ),
                  )
              );
            },
          )
      ),
    );
  }
}
// void signIn(BuildContext context) async {
//
//   try {
//     //sementara ada signout disini dulu
//     await GoogleSignIn().signOut();
//     final user = await GoogleSignIn().signIn();
//
//     final response = await http.post(
//       Uri.parse(GlobalVariables.googleSignin),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'name': user?.displayName,
//         'email': user?.email,
//         'google_id': user?.id,
//         'profile_picture': user?.photoUrl,
//         'notification_token': notificationToken
//       }),
//     );
//     if(response.statusCode == 200){
//       final responseData = jsonDecode(response.body);
//       prefs.setString('isLoginGoogle','true');
//       prefs.setString('user_id','${responseData['user']['id']}');
//       prefs.setString('token','${responseData['token']}');
//       Get.offAllNamed(Routes.BOTTOM_NAVBAR);
//     }
//     if (user == null) {
//       if(Get.isSnackbarOpen != true) {
//         Get.snackbar('Error', 'Sign In Failed');
//       }
//     } else {
//       if(Get.isSnackbarOpen != true) {
//         Get.snackbar('Pesan', 'Success');
//       }
//
//     }
//   } on PlatformException catch (e) {
//     if(Get.isSnackbarOpen != true) {
//       Get.snackbar('Error', 'Sign In Failed - $e');
//     }
//   } catch (e) {
//     if(Get.isSnackbarOpen != true) {
//       Get.snackbar(
//         'Error',
//         '$e',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }finally{
//     loginController.isLoading.value = false;
//   }
// }
