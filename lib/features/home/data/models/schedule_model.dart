class ScheduleModel {
  String teacher;
  String subject;
  String time;
  String room;
  String day;

  ScheduleModel({
    required this.teacher,
    required this.subject,
    required this.time,
    required this.room,
    required this.day,
  });
}

List<ScheduleModel> scheduleData = [
  ScheduleModel(
    teacher: "Budi",
    subject: "Matematika",
    time: "07:00",
    room: "A1",
    day: "Sen",
  ),
  ScheduleModel(
    teacher: "Ani",
    subject: "Fisika",
    time: "08:15",
    room: "A2",
    day: "Sen",
  ),
  ScheduleModel(
    teacher: "Budi",
    subject: "Matematika",
    time: "09:30",
    room: "A1",
    day: "Sel",
  ),
  ScheduleModel(
    teacher: "Citra",
    subject: "Kimia",
    time: "10:15",
    room: "B1",
    day: "Sel",
  ),
  ScheduleModel(
    teacher: "Dedi",
    subject: "Biologi",
    time: "11:00",
    room: "A2",
    day: "Rab",
  ),
  ScheduleModel(
    teacher: "Eka",
    subject: "Sejarah",
    time: "12:30",
    room: "B2",
    day: "Rab",
  ),
  ScheduleModel(
    teacher: "Budi",
    subject: "Matematika",
    time: "07:45",
    room: "A1",
    day: "Kam",
  ),
  ScheduleModel(
    teacher: "Ani",
    subject: "Fisika",
    time: "08:30",
    room: "A2",
    day: "Kam",
  ),
  ScheduleModel(
    teacher: "Citra",
    subject: "Kimia",
    time: "09:15",
    room: "B1",
    day: "Jum",
  ),
  ScheduleModel(
    teacher: "Dedi",
    subject: "Biologi",
    time: "10:00",
    room: "B2",
    day: "Jum",
  ),
];
