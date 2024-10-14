class ScheduleModel {
  int? id;
  int? kelasId;
  String? hari;
  String? jamMulai;
  String? jamSelesai;
  int? pelajaranId;
  int? guruId;
  int? ruangId;
  String? createdAt;
  String? updatedAt;
  Kelas? kelas;
  Pelajaran? pelajaran;
  Guru? guru;
  Ruang? ruang;

  ScheduleModel({
    this.id,
    this.kelasId,
    this.hari,
    this.jamMulai,
    this.jamSelesai,
    this.pelajaranId,
    this.guruId,
    this.ruangId,
    this.createdAt,
    this.updatedAt,
    this.kelas,
    this.pelajaran,
    this.guru,
    this.ruang,
  });

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kelasId = json['kelas_id'];
    hari = json['hari'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    pelajaranId = json['pelajaran_id'];
    guruId = json['guru_id'];
    ruangId = json['ruang_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kelas = json['kelas'] != null ? Kelas.fromJson(json['kelas']) : null;
    pelajaran = json['pelajaran'] != null
        ? Pelajaran.fromJson(json['pelajaran'])
        : null;
    guru = json['guru'] != null ? Guru.fromJson(json['guru']) : null;
    ruang = json['ruang'] != null ? Ruang.fromJson(json['ruang']) : null;
  }

  static List<ScheduleModel> fromJsonList(List list) {
    return list.map((item) => ScheduleModel.fromJson(item)).toList();
  }
}

class Kelas {
  int? id;
  String? namaKelas;
  int? waliKelasId;
  String? createdAt;
  String? updatedAt;
  WaliKelas? waliKelas;

  Kelas({
    this.id,
    this.namaKelas,
    this.waliKelasId,
    this.createdAt,
    this.updatedAt,
    this.waliKelas,
  });

  Kelas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKelas = json['nama_kelas'];
    waliKelasId = json['wali_kelas_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    waliKelas = json['wali_kelas'] != null
        ? WaliKelas.fromJson(json['wali_kelas'])
        : null;
  }
}

class WaliKelas {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? createdAt;
  String? updatedAt;

  WaliKelas({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  WaliKelas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Pelajaran {
  int? id;
  String? namaPelajaran;
  String? createdAt;
  String? updatedAt;

  Pelajaran({
    this.id,
    this.namaPelajaran,
    this.createdAt,
    this.updatedAt,
  });

  Pelajaran.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPelajaran = json['nama_pelajaran'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Guru {
  int? id;
  int? userId;
  int? pelajaranId;
  String? createdAt;
  String? updatedAt;
  WaliKelas? user;
  Pelajaran? pelajaran;

  Guru({
    this.id,
    this.userId,
    this.pelajaranId,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.pelajaran,
  });

  Guru.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pelajaranId = json['pelajaran_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? WaliKelas.fromJson(json['user']) : null;
    pelajaran = json['pelajaran'] != null
        ? Pelajaran.fromJson(json['pelajaran'])
        : null;
  }
}

class Ruang {
  int? id;
  String? namaRuang;
  String? createdAt;
  String? updatedAt;

  Ruang({
    this.id,
    this.namaRuang,
    this.createdAt,
    this.updatedAt,
  });

  Ruang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaRuang = json['nama_ruang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
