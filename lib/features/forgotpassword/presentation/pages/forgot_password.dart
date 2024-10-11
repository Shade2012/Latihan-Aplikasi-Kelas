import 'package:flutter/material.dart';

import '../../../common/appbar_common.dart';
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.08),
          child: AppbarCommon()),
      body: SingleChildScrollView(child: SafeArea(
          child: Column(
            children: [
              
            ],
          )
      )
      ),
    );
  }
}
