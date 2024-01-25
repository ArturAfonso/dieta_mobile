// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dieta_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dieta_mobile/app/data/models/alimento_model.dart';

class AlimentoTile extends StatelessWidget {
  final int index;
  final AlimentoModel alimento;
  const AlimentoTile({
    Key? key,
    required this.index,
    required this.alimento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 80,
        width: Get.size.width,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://picsum.photos/250?image=$index',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        alimento.descricao ?? "--",
                        style: const TextStyle(
                          fontFamily: 'GilmerMedium',
                          //fontWeight: FontWeight.f,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  //const SizedBox(height: 5),
                  Text(
                    'Proteinas: ${alimento.proteinas}',
                    style: const TextStyle(fontSize: 12),
                  ),

                  const Text(
                    'Calorias',
                    style: TextStyle(fontSize: 12),
                  ),

                  const Text(
                    'Gorduras',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.REFEICAOEDIT);
                },
                icon: Icon(
                  Icons.edit,
                  color: Get.theme.primaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
