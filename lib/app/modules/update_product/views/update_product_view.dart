import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data Mahasiswa'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNama.text = data['npm'];
            controller.cNpm.text = data['nama'];
            controller.cAlamat.text = data['alamat'];
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNpm,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Npm Mahasiswa"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNama,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Nama mahasiswa"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cAlamat,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Alamat"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.updateProduct(
                      controller.cNpm.text,
                      controller.cNama.text,
                      controller.cAlamat.text,
                      Get.arguments,
                    ), 
                    child: Text("Update")),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        ),
    );
  }
}
