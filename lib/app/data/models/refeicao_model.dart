import 'package:dieta_mobile/app/data/models/alimento_model.dart';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///

class RefeicaoModel {
/*
{
  "naDieta": true,
  "titulo": "titulo",
  "descricao": "nome",
  "proteinas": 1,
  "carboidratos": 2.3,
  "gorduras": 2.3,
  "calorias": 5.2,
  "alimentos": [
    {
      "descricao": "nome",
      "proteinas": 1,
      "carboidratos": 2.3,
      "gorduras": 2.3,
      "calorias": 5.2
    }
  ],
  "data": "2023-10-10T00:00:00.000Z",
  "diaDaSemana": "Segunda-feira"
} 
*/
  bool naDieta;
  String titulo;
  String? descricao;
  // double? proteinas;
  // double? carboidratos;
  //double? gorduras;
  // double? calorias;
  List<AlimentoModel?>? alimentos;
  DateTime? data;
  String? diaDaSemana;

  RefeicaoModel({
    required this.naDieta,
    required this.titulo,
    this.descricao,
    /*  this.proteinas,
    this.carboidratos,
    this.gorduras,
    this.calorias, */
    this.alimentos,
    this.data,
    this.diaDaSemana,
  });

  RefeicaoModel.fromJson(Map<String, dynamic> json)
      : naDieta = json['naDieta'],
        titulo = json['titulo']?.toString() ?? '' {
    descricao = json['descricao']?.toString();
    /*    proteinas = json['proteinas']?.toDouble();
    carboidratos = json['carboidratos']?.toDouble();
    gorduras = json['gorduras']?.toDouble();
    calorias = json['calorias']?.toDouble(); */
    if (json['alimentos'] != null) {
      final v = json['alimentos'];
      final arr0 = <AlimentoModel>[];
      v.forEach((v) {
        arr0.add(AlimentoModel.fromJson(v));
      });
      alimentos = arr0;
    }
    data = json['data'] != null ? DateTime.parse(json['data']) : null;
    diaDaSemana = json['diaDaSemana']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['naDieta'] = naDieta;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    /*  data['proteinas'] = proteinas;
    data['carboidratos'] = carboidratos;
    data['gorduras'] = gorduras;
    data['calorias'] = calorias; */
    if (alimentos != null) {
      final v = alimentos;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['alimentos'] = arr0;
    }
    data['data'] = this.data?.toIso8601String();
    data['diaDaSemana'] = diaDaSemana;
    return data;
  }

  double totalProteinas({bool? multiplica}) {
    double result = 0.0;
    if (alimentos != null) {
      for (var element in alimentos!) {
        if (element!.proteinas != null) {
          result = result + element.proteinas!;
        }
      }
    }

    if (multiplica != null && multiplica == true) {
      return result * 4;
    } else {
      return result;
    }
  }

  double totalCarboidratos({bool? multiplica}) {
    double result = 0.0;
    if (alimentos != null) {
      for (var element in alimentos!) {
        if (element!.carboidratos != null) {
          result = result + element.carboidratos!;
        }
      }
    }
    if (multiplica != null && multiplica == true) {
      return result * 4;
    } else {
      return result;
    }
  }

  double totalGorduras({bool? multiplica}) {
    double result = 0.0;
    if (alimentos != null) {
      for (var element in alimentos!) {
        if (element!.gorduras != null) {
          result = result + element.gorduras!;
        }
      }
    }

    if (multiplica != null && multiplica == true) {
      return result * 9;
    } else {
      return result;
    }
  }

  double totalCalorias() {
    double result = 0.0;
    result = totalProteinas(multiplica: true) + totalCarboidratos(multiplica: true) + totalGorduras(multiplica: true);

    return result;
  }
}
