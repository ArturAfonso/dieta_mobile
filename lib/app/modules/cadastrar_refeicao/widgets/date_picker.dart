// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/cadastrar_refeicao_controller.dart';

class DateRangePicker extends StatefulWidget {
  /*  final DateTime? startDate;
  final DateTime? startHour; */
  final ValueChanged<DateTime?> onDateChanged;
  final ValueChanged<DateTime?> onHourChanged;
  CadastrarRefeicaoController controller;
  final String? Function(String?)? validator;

  DateRangePicker({
    Key? key,
    required this.onDateChanged,
    required this.onHourChanged,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  DateRangePickerState createState() => DateRangePickerState();
}

class DateRangePickerState extends State<DateRangePicker> {
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      locale: Get.locale,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.secondary, // Altere esta cor para a cor desejada
              onPrimary: Colors.white, // Cor do texto dos botões
              //surface: Colors.blue, // Cor de fundo do cabeçalho
              onSurface: Colors.black, // Cor do texto dos dias
            ),
            dialogBackgroundColor: Colors.white, // Cor de fundo do diálogo
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.0), // Bordas arredondadas
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      widget.controller.dataRefeicaoDateIme = picked;
      widget.controller.dataRefeicaoTxT.text = DateFormat('dd/MM/yyyy').format(picked);
      widget.onDateChanged(picked);
    }
  }

  Future<void> _selectHour(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Localizations.override(
          locale: Get.locale,
          context: context,
          child: Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).colorScheme.secondary, // Altere esta cor para a cor desejada
                onPrimary: Colors.white, // Cor do texto dos botões
                surface: Colors.white, // Cor de fundo do cabeçalho
                onSurface: Theme.of(context).colorScheme.secondary, // Cor do texto dos dias
              ),
              dialogBackgroundColor: Colors.white, // Cor de fundo do diálogo
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0), // Bordas arredondadas
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (picked != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );
      widget.controller.horaRefeicaoDateTime = selectedDateTime;
      widget.controller.horaRefeicaoTxt.text = DateFormat('HH:mm').format(selectedDateTime);
      widget.onHourChanged(selectedDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateFormat hourFormat = DateFormat('HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _selectDate(context, true),
                    child: TextFormField(
                      validator: widget.validator,
                      controller: widget.controller.dataRefeicaoTxT
                        ..text = widget.controller.dataRefeicaoDateIme != null
                            ? dateFormat.format(widget.controller.dataRefeicaoDateIme!)
                            : '',
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => _selectHour(context),
                    child: TextFormField(
                      validator: widget.validator,
                      controller: widget.controller.horaRefeicaoTxt
                        ..text = widget.controller.horaRefeicaoDateTime != null
                            ? hourFormat.format(widget.controller.horaRefeicaoDateTime!)
                            : '',
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
