
import 'package:equatable/equatable.dart';

class KelasEntities extends Equatable {
  final int id;
  final String namaKelas;

  const KelasEntities({
    required this.id,
    required this.namaKelas,
  });

  @override
  List<Object?> get props => [id,namaKelas];
}
