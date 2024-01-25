// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dieta_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefeicaoTile extends StatelessWidget {
  final int index;
  const RefeicaoTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.REFEICAOEDIT);
      },
      child: Card(
        child: SizedBox(
          width: Get.size.width,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Refeição $index',
                          style: const TextStyle(
                            fontFamily: 'GilmerMedium',
                            //fontWeight: FontWeight.f,
                            fontSize: 16,
                          ),
                        ),
                        /*   IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.REFEICAOEDIT);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Get.theme.primaryColor,
                            )) */
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Arroz, Frango, Queijo',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: Get.size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Proteinas',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Calorias',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Gorduras',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
