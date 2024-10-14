import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/login/presentation/widget/google_button/bloc/google_button_bloc.dart';

import '../../../../../core/error/snackbar_error.dart';
import '../../../../../core/themes/images.dart';
import '../../../../../core/themes/textstyle.dart';
class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleButtonBloc,GoogleButtonState>(
      listener: (context, state) {
        if(state is GoogleButtonSuccess){
          context.pushNamed('splash');
          return;
        }else if(state is GoogleButtonError){
          SnackBarError.showError(context, state.error);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            // state = GoogleButtonLoading();
            context.read<GoogleButtonBloc>().add(GoogleButtonPressed());
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Padding(padding: EdgeInsets.symmetric(vertical: 10)
                ,child: state is GoogleButtonLoading
                    ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.logoGoogle),
                    Text('Login dengan Google',style: txtLightGrey,)
                  ],
                ),),
            ),
          ),
        );
      },
    );
  }
}
