import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/themes/textstyle.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning 👋", style: txtInputHint),
                        Text("Abid Fadullah Maajid", style: txtRegularBlack),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pushNamed('notification_user');
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
