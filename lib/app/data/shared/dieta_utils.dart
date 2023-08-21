// ignore_for_file: avoid_print

import 'package:dieta_mobile/app/data/models/refeicao_model.dart';

class DietaUtils {
  static double proteinaGeral(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalProteinas();
    }
    return result;
  }

  static double proteinaKcal(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalProteinas(multiplica: true);
    }
    return result;
  }

  static double proteinaGramaKilo(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalProteinas();
    }
    return result / 100;
  }

  static double carboGeral(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalCarboidratos();
    }
    return result;
  }

  static double carboKcal(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalCarboidratos(multiplica: true);
    }
    return result;
  }

  static double carboGramaKilo(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalCarboidratos();
    }
    return result / 100;
  }

  static double gorduraGeral(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalGorduras();
    }
    return result;
  }

  static double gorduraKcal(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalGorduras(multiplica: true);
    }
    return result;
  }

  static double gorduraGramaKilo(List<RefeicaoModel> refeicoes) {
    double result = 0.0;
    for (var ref in refeicoes) {
      result = result + ref.totalGorduras();
    }
    result = result / 100;
    result = double.parse(result.toStringAsFixed(1));
    return result;
  }

  static double ckalTotal(List<RefeicaoModel> refeicoes) {
    double ckal = 0.0;
    ckal = proteinaKcal(refeicoes) + carboKcal(refeicoes) + gorduraKcal(refeicoes);
    return ckal;
  }

  static double metaProteina({required double meta, required double peso}) {
    double result = 0.0;
    result = meta * peso;
    return result;
  }

  static double proteinaAlcancadaMenosMetaProteina({required double meta, required double alcancado}) {
    double result = 0.0;
    result = alcancado - meta;
    return result;
  }

/* 
proteina total = soma das proteinas sem multiplicacoes
proteina kcal = soma das proteinas multiplicando
grama/kilo proteina = proteina total / peso 
 */

  //---------------------------------------------------------

  static double calcularGCD(
      {required String sexo,
      required String intensidade,
      required double peso,
      required int altura,
      required int idade}) {
    double gastoCaloricoDiario = 0.0;
    if (sexo == "H" || sexo == "h") {
      //gastoCaloricoDiario = 88.362 + (13.397 * peso) + (4.799 * altura) - (5.677 * idade);
      gastoCaloricoDiario = 66.47 + (13.75 * peso) + (4.799 * altura) - (5.677 * idade);
    } else {
      gastoCaloricoDiario = 447.593 + (9.247 * peso) + (5 * altura) - (6.8 * idade);
    }

    gastoCaloricoDiario = calcularIntensidade(intensidade, gastoCaloricoDiario);
    gastoCaloricoDiario = double.parse(gastoCaloricoDiario.toStringAsFixed(2));

    print(gastoCaloricoDiario);
    return gastoCaloricoDiario;
  }

  static double calcularIntensidade(String intensidade, double valorCalorico) {
    double result;
    const double sedentario = 1; //1.2; //pouco ou nenhum exercício
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
}
