import '../../data/models/schedule_model.dart';

class ScheduleEntity {
  final int id;
  final int kelasId;
  final String hari;
  final String jamMulai;
  final String jamSelesai;
  final int pelajaranId;
  final int guruId;
  final int ruangId;
  KelasEntity kelasList;
  PelajaranEntity pelajaranList;
  GuruEntity guruList;
  RuangEntity ruangList;

  ScheduleEntity({
    required this.id,
    required this.kelasId,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
    required this.pelajaranId,
    required this.guruId,
    required this.ruangId,
    required this.kelasList,
    required this.pelajaranList,
    required this.guruList,
    required this.ruangList,
  });

  // Factory constructor for converting ScheduleModel to ScheduleEntity
  factory ScheduleEntity.fromModel(ScheduleModel model) {
    return ScheduleEntity(
      id: model.id ?? 0,
      kelasId: model.kelasId ?? 0,
      hari: model.hari ?? '',
      jamMulai: model.jamMulai ?? '',
      jamSelesai: model.jamSelesai ?? '',
      pelajaranId: model.pelajaranId ?? 0,
      guruId: model.guruId ?? 0,
      ruangId: model.ruangId ?? 0,
      kelasList: model.kelas != null
          ? KelasEntity(
              id: model.kelas!.id ?? 0,
              namaKelas: model.kelas!.namaKelas ?? '',
              waliKelasId: model.kelas!.waliKelasId ?? 0,
            )
          : KelasEntity(id: 0, namaKelas: '', waliKelasId: 0),
      pelajaranList: model.pelajaran != null
          ? PelajaranEntity(
              id: model.pelajaran!.id ?? 0,
              namaPelajaran: model.pelajaran!.namaPelajaran ?? '',
            )
          : PelajaranEntity(id: 0, namaPelajaran: ''),
      guruList: model.guru != null
          ? GuruEntity(
              id: model.guru!.id ?? 0,
              userId: model.guru!.userId ?? 0,
              pelajaranId: model.guru!.pelajaranId ?? 0,
            )
          : GuruEntity(id: 0, userId: 0, pelajaranId: 0),
      ruangList: model.ruang != null
          ? RuangEntity(
              id: model.ruang!.id ?? 0,
              namaRuang: model.ruang!.namaRuang ?? '',
            )
          : RuangEntity(id: 0, namaRuang: ''),
    );
  }
}

class KelasEntity {
  final int id;
  final String namaKelas;
  final int waliKelasId;

  KelasEntity({
    required this.id,
    required this.namaKelas,
    required this.waliKelasId,
  });
}

class PelajaranEntity {
  final int id;
  final String namaPelajaran;

  PelajaranEntity({
    required this.id,
    required this.namaPelajaran,
  });
}

class GuruEntity {
  final int id;
  final int userId;
  final int pelajaranId;

  GuruEntity({
    required this.id,
    required this.userId,
    required this.pelajaranId,
  });
}

class RuangEntity {
  final int id;
  final String namaRuang;

  RuangEntity({
    required this.id,
    required this.namaRuang,
  });
}
