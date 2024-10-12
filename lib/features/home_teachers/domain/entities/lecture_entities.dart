import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Lecture extends Equatable {
  final int id;
  final String name;
  final String kelas;
  final String ruang;

  const Lecture({
    required this.id,
    required this.name,
    required this.kelas,
    required this.ruang,
  });

  @override
  List<Object?> get props => [id,name, kelas, ruang];
}

class DaySchedule extends Equatable {
  final int id;
  final String name;
  final List<Lecture> lectures;

  const DaySchedule({
    required this.id,
    required this.name,
    required this.lectures,
  });

  @override
  List<Object?> get props => [id,name, lectures];
}

class ScheduleResponse extends Equatable {
  final List<DaySchedule> schedule;

  const ScheduleResponse({
    required this.schedule,
  });

  @override
  List<Object?> get props => [schedule];
}
