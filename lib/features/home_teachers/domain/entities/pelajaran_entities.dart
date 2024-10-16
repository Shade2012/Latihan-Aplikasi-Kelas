
import 'package:equatable/equatable.dart';

class PelajaranEntities extends Equatable {
  final int id;
  final String namaPelajaran;

  const PelajaranEntities({
    required this.id,
    required this.namaPelajaran,
  });

  @override
  List<Object?> get props => [id,namaPelajaran];
}
