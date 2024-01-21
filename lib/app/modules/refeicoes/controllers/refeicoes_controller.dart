import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dieta_mobile/app/data/models/refeicao_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RefeicoesController extends GetxController {
  RxList<RefeicaoModel> listRefeicoes = <RefeicaoModel>[].obs;
  @override
  void onInit() {
    listRefeicoes.addAll([
      RefeicaoModel(calorias: 50),
      RefeicaoModel(calorias: 20),
      RefeicaoModel(calorias: 15),
      RefeicaoModel(calorias: 32)
    ]);
    super.onInit();
  }

  TextEditingController nomeRefeicao = TextEditingController();
  RxString base64Image = ''.obs;

  void showSelectImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Importar imagem',
              style: TextStyle(color: Get.theme.primaryColor),
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Adicione a função desejada para a câmera aqui
                    print('Câmera pressionada');
                    Get.back();
                    checkPermissionAndOpenGallery(cam: true);
                  },
                  child: Container(
                    height: Get.size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text('Tirar foto'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Adicione a função desejada para a galeria aqui
                    print('Galeria pressionada');
                    Get.back();
                    checkPermissionAndOpenGallery();
                  },
                  child: Container(
                    height: Get.size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text('Galeria'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> checkPermissionAndOpenGallery({bool? cam}) async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      /// use [Permissions.storage.status]
      final status = await Permission.storage.status;
      if (status == PermissionStatus.granted) {
        final image = await ImagePicker().pickImage(source: cam == true ? ImageSource.camera : ImageSource.gallery);
        if (image != null) {
          base64Image.value = convertImageToBase64(File(image.path));
        }
        print(image);
        // Do something with the image
      } else {
        await Permission.storage.request().then((value) async {
          final image = await ImagePicker().pickImage(source: cam == true ? ImageSource.camera : ImageSource.gallery);
          if (image != null) {
            base64Image.value = convertImageToBase64(File(image.path));
          }
          print(image);
        });
      }
    } else {
      /// use [Permissions.photos.status]
      var status = await Permission.photos.status;
      print(status);
      if (status == PermissionStatus.granted) {
        final image = await ImagePicker().pickImage(source: cam == true ? ImageSource.camera : ImageSource.gallery);
        if (image != null) {
          base64Image.value = convertImageToBase64(File(image.path));
        }
        print(image);

        // Do something with the image
      } else {
        await Permission.photos.request().then((value) async {
          final image = await ImagePicker().pickImage(source: cam == true ? ImageSource.camera : ImageSource.gallery);
          if (image != null) {
            base64Image.value = convertImageToBase64(File(image.path));
          }
          print(image);
        });
      }
    }
  }

  String convertImageToBase64(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      //_handleLostFiles(files);
    } else {
      //_handleError(response.exception);
    }
  }
}
