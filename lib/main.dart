import 'package:dieta_mobile/app/data/theme/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init('storage');
  // calcularGCD(intensidade: 'Sedentário', altura: 173, idade: 30, peso: 100, sexo: "H");
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: lightTheme,
      //darkTheme: darkTheme,
      //themeMode: getTheme(),
    ),
  );
}

/* enum Atividade {
  sedentario,
  laranja,
  banana,
  uva,
} */

