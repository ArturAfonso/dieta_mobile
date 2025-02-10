import 'package:flutter/services.dart';

class AppUtils {
  static String formattedDate(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}';
  }

  static String alternativeFormattedDate(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} às ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  static String formatDouble(double value) {
    return value.toStringAsFixed(value % 1 == 0 ? 0 : 1);
  }
}

class CommaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains('.')) {
      return oldValue;
    }
    if (newValue.text.split(',').length > 2) {
      return oldValue;
    }
    return newValue;
  }
}


/*  static String formattedDate(DateTime dateTime) {
    final months = [
      'janeiro',
      'fevereiro',
      'março',
      'abril',
      'maio',
      'junho',
      'julho',
      'agosto',
      'setembro',
      'outubro',
      'novembro',
      'dezembro'
    ];
    return '${dateTime.day.toString().padLeft(2, '0')} de ${months[dateTime.month - 1]} de ${dateTime.year}';
  }*/