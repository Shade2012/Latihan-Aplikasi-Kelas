import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String title;
  final String message; // Tambahkan properti ini
  final DateTime createdAt; // Ubah tipe data ini

  NotificationEntity({
    required this.title,
    required this.message,
    required this.createdAt,
  });

  @override
  List<Object> get props => [title, message, createdAt]; // Tambahkan message dan createdAt ke dalam props
}

