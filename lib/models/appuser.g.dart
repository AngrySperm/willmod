// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser()
  ..id = json['id'] as int?
  ..kode = json['kode'] as String?
  ..nama = json['nama'] as String?
  ..userId = json['userId'] as String?
  ..password = json['password'] as String?
  ..namaJabatan = json['namaJabatan'] as String?
  ..telepon1 = json['telepon1'] as String?
  ..telepon2 = json['telepon2'] as String?
  ..email = json['email'] as String?
  ..alamat = json['alamat'] as String?
  ..tipeUser = json['tipeUser'] as int?
  ..imageUrl = json['imageUrl'] as String?
  ..tanggalJoin = json['tanggalJoin'] == null
      ? null
      : DateTime.parse(json['tanggalJoin'] as String)
  ..tanggalLahir = json['tanggalLahir'] == null
      ? null
      : DateTime.parse(json['tanggalLahir'] as String)
  ..test = json['test'] as String?;

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'kode': instance.kode,
  'nama': instance.nama,
  'userId': instance.userId,
  'password': instance.password,
  'namaJabatan': instance.namaJabatan,
  'telepon1': instance.telepon1,
  'telepon2': instance.telepon2,
  'email': instance.email,
  'alamat': instance.alamat,
  'tipeUser': instance.tipeUser,
  'imageUrl': instance.imageUrl,
  'tanggalJoin': instance.tanggalJoin?.toIso8601String(),
  'tanggalLahir': instance.tanggalLahir?.toIso8601String(),
  'test': instance.test,
};