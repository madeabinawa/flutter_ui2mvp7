class UserModel {
  int id, status, roleId;
  String nama, alamat, phone1, phone2, email1, email2;
  UserModel({
    this.id,
    this.nama,
    this.alamat,
    this.email1,
    this.phone1,
    this.email2,
    this.phone2,
    this.status,
    this.roleId,
  });

  factory UserModel.fromJson(Map<String, dynamic> user) {
    return UserModel(
      id: user['Id'],
      nama: user['nama'],
      alamat: user['alamat'],
      email1: user['email1'],
      phone1: user['phone1'],
      email2: user['email2'],
      phone2: user['phone2'],
      status: user['status'],
      roleId: user['role_id'],
    );
  }
}
