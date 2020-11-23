class ScheduleModel {
  int idSchedule, location, pbaId, pcuId, status;
  String tanggalJadwal, note;
  ScheduleModel({
    this.idSchedule,
    this.tanggalJadwal,
    this.note,
    this.location,
    this.pcuId,
    this.pbaId,
    this.status,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> schedule) {
    return ScheduleModel(
      idSchedule: schedule['Id'],
      tanggalJadwal: schedule['tanggal_jadwal'],
      note: schedule['note'],
      location: schedule['location_id'],
      pbaId: schedule['pba_id'],
      pcuId: schedule['pcu_id'],
      status: schedule['status'],
    );
  }
}
