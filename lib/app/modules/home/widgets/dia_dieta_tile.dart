// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../data/models/refeicao_model.dart';
import '../../../data/shared/app_utils.dart';
import '../../refeicoes/widgets/refeicao_resumida_tile.dart';

class DiaDietaTile extends StatelessWidget {
  const DiaDietaTile({
    Key? key,
    required this.refeicoes,
  }) : super(key: key);
  final List<RefeicaoModel> refeicoes;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = refeicoes.first.data!;
    String formattedDate = AppUtils.formattedDate(dateTime);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formattedDate, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        RefeicaoResumidaTile(refeicoes: refeicoes),
        const SizedBox(height: 20),
      ],
    );
  }
}
