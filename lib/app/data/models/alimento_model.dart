///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class AlimentoModel {
/*
{
  "descricao": "nome",
  "proteinas": 1,
  "carboidratos": 2.3,
  "gorduras": 2.3,
  "calorias": 5
} 
*/

  String? descricao;
  double? proteinas;
  double? carboidratos;
  double? gorduras;
  double? calorias;

  AlimentoModel({
    required this.descricao,
    this.proteinas,
    this.carboidratos,
    this.gorduras,
    this.calorias,
  });
  AlimentoModel.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao']?.toString();
    proteinas = json['proteinas']?.toInt();
    carboidratos = json['carboidratos']?.toDouble();
    gorduras = json['gorduras']?.toDouble();
    calorias = json['calorias']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['descricao'] = descricao;
    data['proteinas'] = proteinas;
    data['carboidratos'] = carboidratos;
    data['gorduras'] = gorduras;
    data['calorias'] = calorias;
    return data;
  }
}
