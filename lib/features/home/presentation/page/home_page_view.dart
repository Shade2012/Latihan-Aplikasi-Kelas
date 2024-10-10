import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homepage'),centerTitle: true,),
      body: SizedBox(
        height: 800,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){},
              title: Text('User ${index +1}'),
            );
          },
        ),
      ),
    );
  }
}
