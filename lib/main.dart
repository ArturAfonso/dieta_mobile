import 'package:dieta_mobile/app/controllers/local_database_controller.dart';
import 'package:dieta_mobile/app/data/theme/themes.dart';
import 'package:dieta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:dieta_mobile/app/modules/informacoes/controllers/saveinfo_controller.dart';
import 'package:dieta_mobile/app/modules/metas/controllers/metas_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/informacoes/controllers/informacoes_controller.dart';
import 'app/modules/refeicoes/controllers/refeicoes_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init('storage');
  Get.put(LocalDatabaseController());
  Get.put(AuthController());
  AuthController cAuth = Get.find();

  Get.lazyPut(() => RefeicoesController());
  Get.lazyPut(() => InformacoesController());
  Get.lazyPut(() => SaveInfoUserController());
  Get.lazyPut(() => MetasController());
  // calcularGCD(intensidade: 'Sedentário', altura: 173, idade: 30, peso: 100, sexo: "H");

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL, //cAuth.loadUserLogado(),
      getPages: AppPages.routes,
      theme: lightTheme,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,

      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
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

