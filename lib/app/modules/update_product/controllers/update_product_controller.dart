import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  //TODO: Implement UpdateProductController

  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<DocumentSnapshot<Object?>> getData(String id) async{
  DocumentReference docDef = firestore.collection("mahasiswa").doc(id);

  return docDef.get();
}

void updateProduct (String nama, String npm, String alamat, String id) async{
  DocumentReference productByid = firestore.collection("mahasiswa").doc(id);

  try {
    await productByid.update({
      "npm": npm,
      "nama": nama,
      "alamat": alamat,
    });
     Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil mengubah data product",
      onConfirm: (){
        cNpm.clear();
        cNama.clear();
        cAlamat.clear();
        Get.back();
        Get.back();
      },
      textConfirm: "OK",
    );
  } catch (e) {
    print(e);
    Get.defaultDialog(
      title: "Terjadi kesalahan",
      middleText: "Gagal Menambahkan Data Product",  
    );
  }
}

@override
void onInit(){
  cNpm = TextEditingController();
  cNama = TextEditingController();
  cAlamat = TextEditingController();
  super.onInit();
}

@override
void onClose(){
  cNpm.dispose();
  cNama.dispose();
  cAlamat.dispose();
  super.onClose();
}

}
