import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/appbar_common.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/repositories/notification_user_repositories.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/models/notification_user_models.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';

class NotificationUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.08),
        child: AppbarCommon(),
      ),
      body: BlocProvider(
        create: (context) => NotificationAdminBloc(notificationRepository: NotificationAdminRepository())
          ..add(LoadNotifications()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notification Anda",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(child: NotificationList()),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<NotificationAdminBloc, NotificationAdminState>(
      builder: (context, state) {
        if (state is NotificationLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NotificationLoaded) {
          return ListView.builder(
            itemCount: state.notifications.length,
            itemBuilder: (context, index) {
              final notification = state.notifications[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: ColorsResources.primaryColor,
                  child: Icon(Icons.notifications_none, color: Colors.white),
                ),
                title: Text(notification.title),
                subtitle: Text("Today at ${notification.time}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(notification.relativeTime, style: TextStyle(color: Colors.red)),
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.01), // Menyesuaikan jarak dari atas
                      alignment: Alignment.topCenter,
                      child: Icon(Icons.circle, size: 8, color: ColorsResources.primaryColor),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is NotificationError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Container();
        }
      },
    );
  }
}
