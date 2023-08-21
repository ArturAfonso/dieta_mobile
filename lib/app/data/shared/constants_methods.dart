class ConstantMethods {
  ConstantMethods._();

  static String getLabelFA(String fa) {
    String label = '';
    Map<String, String> labelsText = {
      "Sedentário": "pouco ou nenhum exercício",
      'Levemente Ativo': "exercício leve/esporádico",
      'Moderadamente Ativo': " exercício moderado/3-4 vezes por semana",
      'Muito Ativo': "exercício intenso/6-7 vezes por semana",
      'Extremamente Ativo': "exercício muito intenso e trabalho físico",
    };
    if (labelsText.containsKey(fa)) {
      label = labelsText[fa].toString();
    }
    return label;
  }

  static Map<String, dynamic> makeObjectError(
      {required bool hasError, required int statusCode, required String statusText}) {
    Map<String, dynamic>? error = {"hasError": hasError, "statusCode": statusCode, "statusText": statusText};
    return error;
  }

  static String removeDecimalIfZero(String number) {
    String numberString = number;
    List<String> parts = numberString.split('.');

    if (parts.length > 1 && parts[1][0] == '0') {
      return parts[0];
    } else {
      return numberString;
    }
  }
}
