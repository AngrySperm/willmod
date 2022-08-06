import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appuser.g.dart';

@JsonSerializable()
class AppUser {
  // 0 = it
  // 1 = owner
  // 2 = bc
  // 3 = admin / cashier
  // 4 = doctor
  // 5 = gm

  int? id = 0;
  String? kode = "";
  String? nama = "";
  String? userId = "";
  String? password = "";
  String? namaJabatan = "";
  String? telepon1="", telepon2="";
  String? email="";
  String? alamat="";
  int? tipeUser = 0;
  String? imageUrl = "";
  DateTime? tanggalJoin;
  DateTime? tanggalLahir;
  String? test;

  AppUser();

  AppUser.create(this.id, this.kode, this.nama, this.userId, this.password,
      this.namaJabatan, this.tipeUser, this.imageUrl);

  AppUser.nama(this.nama);

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}