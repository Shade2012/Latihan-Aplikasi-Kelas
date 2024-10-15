import 'package:latihan_aplikasi_manajemen_kelas/features/home/domain/entities/schedule_entities.dart';

class ScheduleModel extends ScheduleEntity {
  const ScheduleModel({
    required super.id,
    required super.kelas,
    required super.hari,
    required super.jamMulai,
    required super.jamSelesai,
    required super.pelajaran,
    required super.guru,
    required super.ruang,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
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

  @override
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

  static List<ScheduleModel> fromJsonList(List<dynamic> json) {
    List<ScheduleModel> schedules = [];
    for (var schedule in json) {
      schedules.add(ScheduleModel.fromJson(schedule));
    }
    return schedules;
  }
}
