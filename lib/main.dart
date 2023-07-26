import 'package:dieta_mobile/app/data/theme/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init('storage');
  //calcularGCD(intensidade: 'Sedentário', altura: 173, idade: 30, peso: 100, sexo: "H");
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

void calcularGCD(
    {required String sexo,
    required String intensidade,
    required double peso,
    required int altura,
    required int idade}) {
  double gastoCaloricoDiario;
  if (sexo == "H" || sexo == "h") {
    gastoCaloricoDiario = 88.362 + (13.397 * peso) + (4.799 * altura) - (5.677 * idade);
  } else {
    gastoCaloricoDiario = 447.593 + (9.247 * peso) + (3.098 * altura) - (4.330 * idade);
  }

  gastoCaloricoDiario = calcularIntensidade(intensidade, gastoCaloricoDiario);

  print(gastoCaloricoDiario);
}

double calcularIntensidade(String intensidade, double valorCalorico) {
  double result;
  const double sedentario = 1.2; //pouco ou nenhum exercício
  const double levementeAtivo = 1.375; //exercício leve/esporádico
  const double moderadamenteAtivo = 1.55; //exercício moderado/3-4 vezes por semana
  const double muitoAtivo = 1.725; //exercício intenso/6-7 vezes por semana
  const double extremamenteAtivo = 1.9; //exercício muito intenso e trabalho físico

  switch (intensidade) {
    case 'Sedentário':
      result = valorCalorico * sedentario;

      break;
    case 'Levemente Ativo':
      result = valorCalorico * levementeAtivo;
      break;
    case 'Moderadamente Ativo':
      result = valorCalorico * moderadamenteAtivo;
      break;
    case 'Muito Ativo':
      result = valorCalorico * muitoAtivo;
      break;
    case 'Extremamente Ativo':
      result = valorCalorico * extremamenteAtivo;
      break;
    default:
      result = 0.0;
  }
  return result;
}

/**
 * homens
 * Gasto Calórico Diário = 88,362 + (13,397 x peso em kg) + (4,799 x altura em cm) - (5,677 x idade em anos)
 * 
 * 
 * mulheres
 * Para mulheres:
 * Gasto Calórico Diário = 447,593 + (9,247 x peso em kg) + (3,098 x altura em cm) - (4,330 x idade em anos)
 */


/**
 * Sedentário (pouco ou nenhum exercício): Gasto Calórico Diário x 1.2
Levemente Ativo (exercício leve/esporádico): Gasto Calórico Diário x 1.375
Moderadamente Ativo (exercício moderado/3-4 vezes por semana): Gasto Calórico Diário x 1.55
Muito Ativo (exercício intenso/6-7 vezes por semana): Gasto Calórico Diário x 1.725
Extremamente Ativo (exercício muito intenso e trabalho físico): Gasto Calórico Diário x 1.9
 */
