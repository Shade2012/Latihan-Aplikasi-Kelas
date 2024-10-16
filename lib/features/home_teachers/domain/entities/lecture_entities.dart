import 'package:equatable/equatable.dart';

class Lecture extends Equatable {
  final int id;
  final String jamMulai;
  final String jamSelesai;
  final String hari;
  final String namaPelajaran;
  final String kelas;
  final String guru;
  final String ruang;

  const Lecture({
    required this.id,
    required this.namaPelajaran,
    required this.jamMulai,
    required this.jamSelesai,
    required this.hari,
    required this.kelas,
    required this.guru,
    required this.ruang,
  });

  @override
  List<Object?> get props => [id,guru,namaPelajaran, kelas, ruang, jamMulai, jamSelesai, hari];
}

class DaySchedule extends Equatable {
  final String name;
  final List<Lecture> lectures;

  const DaySchedule({
    required this.name,
    required this.lectures,
  });

  @override
  List<Object?> get props => [name, lectures];
}

