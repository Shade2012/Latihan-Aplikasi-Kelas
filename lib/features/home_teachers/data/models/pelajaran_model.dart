import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/kelas_entities.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/pelajaran_entities.dart';

class PelajaranModel extends PelajaranEntities{
  PelajaranModel({required super.id, required super.namaPelajaran});

  factory PelajaranModel.fromJson(Map<String,dynamic> json){
    return PelajaranModel
      (
        id: json['id']?? 0,
        namaPelajaran: json['nama_pelajaran']?? ''
    );
  }
  Map<String,dynamic> toJson() {
    return{
      'id': id.toString(),
      'nama_pelajaran':namaPelajaran
    };
  }
  static List<PelajaranModel> fromJsonList(List data){
    if(data.isEmpty) return[];
    PelajaranModel emptyPelajaran = PelajaranModel(id: 0, namaPelajaran: 'Semua Pelajaran');
    List<PelajaranModel> pelajaranList = data.map((singleData) => PelajaranModel.fromJson(singleData)).toList();
    pelajaranList.insert(0, emptyPelajaran);
    return pelajaranList;
  }
}
