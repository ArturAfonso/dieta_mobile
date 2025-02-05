// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dieta_mobile/app/data/models/refeicao_model.dart';

import '../../../routes/app_pages.dart';

class RefeicaoResumidaTile extends StatelessWidget {
  final List<RefeicaoModel> refeicoes;
  const RefeicaoResumidaTile({
    Key? key,
    required this.refeicoes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(refeicoes.length, (index) {
        final refeicao = refeicoes[index];
        return InkWell(
          onTap: () {
            Get.toNamed(Routes.REFEICOES, arguments: refeicao);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withAlpha(120)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${refeicao.data!.hour.toString().padLeft(2, '0')}:${refeicao.data!.minute.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  VerticalDivider(
                    color: Theme.of(context).colorScheme.outlineVariant.withAlpha(120),
                    thickness: 2,
                    width: 20,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      refeicao.titulo ?? "Sem titulo",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Icon(
                      Icons.circle,
                      color: refeicao.naDieta
                          ? Theme.of(context).colorScheme.secondaryContainer
                          : Theme.of(context).colorScheme.primaryContainer,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
