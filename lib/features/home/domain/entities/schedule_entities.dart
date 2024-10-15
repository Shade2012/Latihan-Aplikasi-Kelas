import 'package:equatable/equatable.dart';

import '../../data/models/schedule_model.dart';

class ScheduleEntity extends Equatable {
  final int id;

  final String kelas;
  final String hari;
  final String jamMulai;
  final String jamSelesai;
  final String pelajaran;
  final String guru;
  final String ruang;
  final String createdAt;
  final String updatedAt;

  const ScheduleEntity(
      {required this.id,
      required this.kelas,
      required this.hari,
      required this.jamMulai,
      required this.jamSelesai,
      required this.pelajaran,
      required this.guru,
      required this.ruang,
      required this.createdAt,
      required this.updatedAt});

  // Convert ScheduleEntity to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kelas': kelas,
      'hari': hari,
      'jam_mulai': jamMulai,
      'jam_selesai': jamSelesai,
      'pelajaran': pelajaran,
      'guru': guru,
      'ruang': ruang,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  // Convert JSON to ScheduleEntity
  factory ScheduleEntity.fromJson(Map<String, dynamic> json) {
    return ScheduleEntity(
      id: json['id'],
      kelas: json['kelas'],
      hari: json['hari'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      pelajaran: json['pelajaran'],
      guru: json['guru'],
      ruang: json['ruang'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  factory ScheduleEntity.fromModel(ScheduleModel model) {
    return ScheduleEntity(
      id: model.id,
      kelas: model.kelas,
      hari: model.hari,
      jamMulai: model.jamMulai,
      jamSelesai: model.jamSelesai,
      pelajaran: model.pelajaran,
      guru: model.guru,
      ruang: model.ruang,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        kelas,
        hari,
        jamMulai,
        jamSelesai,
        pelajaran,
        guru,
        ruang,
        createdAt,
        updatedAt,
      ];
}
