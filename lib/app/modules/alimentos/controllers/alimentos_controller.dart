import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dieta_mobile/app/controllers/local_database_controller.dart';
import 'package:dieta_mobile/app/data/models/alimento_model.dart';
import 'package:dieta_mobile/app/data/shared/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/shared/custom_button.dart';

class AlimentosController extends GetxController {
  LocalDatabaseController cLocalDatabase = Get.find();
  //Alimentos view
  GlobalKey<FormState> alimentosFormKey = GlobalKey<FormState>();

  //cadastrar alimentos view
  GlobalKey<FormState> cadAlimentosFormKey = GlobalKey<FormState>();
  TextEditingController cadNomeAlimento = TextEditingController();
  TextEditingController cadDescricaoAlimento = TextEditingController();

  TextEditingController cadProteinaAlimento = TextEditingController();
  TextEditingController cadCarboidratoAlimento = TextEditingController();
  TextEditingController cadGorduraAlimento = TextEditingController();
  TextEditingController cadCaloriaAlimento = TextEditingController();
  TextEditingController cadUnidadeAlimento = TextEditingController();
  TextEditingController cadQuantidadeAlimento = TextEditingController();
  RxString base64Image = ''.obs;

  void clearFields() {
    cadNomeAlimento.clear();
    cadDescricaoAlimento.clear();
    cadProteinaAlimento.clear();
    cadCarboidratoAlimento.clear();
    cadGorduraAlimento.clear();
    cadCaloriaAlimento.clear();
    cadUnidadeAlimento.clear();
    cadQuantidadeAlimento.clear();
    base64Image.value = '';
  }

  Uint8List base64Decode(String base64String) {
    return base64.decode(base64String);
  }

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

  void saveAlimento(BuildContext context) {
    if (cadAlimentosFormKey.currentState!.validate()) {
      AlimentoModel newAliment = AlimentoModel(
          descricao: cadNomeAlimento.text,
          proteinas: convertStringToDouble(cadProteinaAlimento.text),
          carboidratos: convertStringToDouble(cadCarboidratoAlimento.text),
          gorduras: convertStringToDouble(cadGorduraAlimento.text));
      if (newAliment.calorias != null && newAliment.calorias! > 0) {
        cadCaloriaAlimento.text = AppUtils.formatDouble(convertStringToDouble(newAliment.calorias.toString()));
      }
      print(newAliment.toJson());
      confirmSaveAlimento(context, newAliment);
    }
  }

  void confirmSaveAlimento(BuildContext context, AlimentoModel alimento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.white, // Define a cor de fundo como branca
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Text(
                    'Deseja realmente salar o alimento?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          text: 'Cancelar',
                          onPressed: () => Navigator.of(context).pop(false),
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).textTheme.titleLarge!.color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          text: 'Sim, salvar',
                          onPressed: () {
                            cLocalDatabase.listAlimentos.add(alimento);
                            update();
                            // Get.offAllNamed(Routes.ALIMENTOS);
                            Get.back();
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double convertStringToDouble(String value) {
    try {
      return double.parse(value);
    } catch (e) {
      throw FormatException("Erro ao converter a string para double: $value");
    }
  }

  void calcularCalorias() {
    try {
      final proteina = double.parse(cadProteinaAlimento.text);
      final carboidrato = double.parse(cadCarboidratoAlimento.text);
      final gordura = double.parse(cadGorduraAlimento.text);

      final calorias = (proteina * 4) + (carboidrato * 4) + (gordura * 9);
      cadCaloriaAlimento.text = calorias.toStringAsFixed(2);
    } catch (e) {
      cadCaloriaAlimento.clear();
      print(e);
    }
  }
}
