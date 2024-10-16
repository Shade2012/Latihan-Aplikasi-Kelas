import 'package:latihan_aplikasi_manajemen_kelas/features/home_teachers/domain/entities/kelas_entities.dart';

class KelasModel extends KelasEntities{
  KelasModel({required super.id, required super.namaKelas});
  factory KelasModel.fromJson(Map<String,dynamic> json){
    return KelasModel
    (
        id: json['id']?? 0,
        namaKelas: json['nama_kelas']?? ''
    );
  }
  Map<String,dynamic> toJson() {
    return{
      'id': id.toString(),
      'nama_kelas':namaKelas
    };
  }
  static List<KelasModel> fromJsonList(List data){
    if(data.isEmpty) return [];
    return data.map((singleData) => KelasModel.fromJson(singleData)).toList();
  }
}
