// ignore_for_file: unused_local_variable

import 'package:dieta_mobile/app/modules/refeicoes/widgets/refeicao_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/refeicoes_controller.dart';

class RefeicoesView extends GetView<RefeicoesController> {
  const RefeicoesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Refeições',
            // style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return RefeicaoTile(index: index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 3,
              thickness: 1,
              color: Colors.grey[300],
            );
          },
        ));
  }
}
