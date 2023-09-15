import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController

  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String npm, String nama, String alamat) async {
    CollectionReference product = firestore.collection("mahasiswa_21312032");

    try{
      await product.add({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,

      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data produk",
        onConfirm: () {
          cNpm.clear();
          cNama.clear();
          cAlamat.clear();
          Get.back();
          Get.back();
          textConfirm: "OK";
        },
      );
    }catch(e){

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNpm = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNpm.dispose();
    cNama.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}
