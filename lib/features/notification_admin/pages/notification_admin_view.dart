import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_aplikasi_manajemen_kelas/common/appbar_common.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_event.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/bloc/notification_user_state.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/repositories/notification_user_repositories_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/notification_user/data/datasources/notification_remote_datasource_impl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/network/dio_instance.dart';
import 'package:latihan_aplikasi_manajemen_kelas/core/themes/colors.dart';

class NotificationAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    // Inisialisasi RemoteDataSource dan Repository
    final remoteDataSource = NotificationRemoteDataSourceImpl(dioInstance: DioInstance());
    final notificationRepository = NotificationAdminRepository(remoteDataSource: remoteDataSource);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorsResources.greyAppBar,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 20,
            ),
          ),
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
      ),
      body: BlocProvider(
        create: (context) => NotificationAdminBloc(notificationRepository: notificationRepository)
          ..add(LoadNotifications()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Notifikasi Anda",
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
          if (state.notifications.isEmpty) {
            return Center(
              child: Text(
                'Tidak ada notifikasi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            );
          }
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
                subtitle: Text(notification.message), // Tampilkan pesan notifikasi
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Created at: ${notification.createdAt.toLocal().toString().substring(0, 16)}", // Format tanggal
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
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
