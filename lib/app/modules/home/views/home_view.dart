import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../data/models/alimento_model.dart';
import '../../../data/models/refeicao_model.dart';
import '../../../data/shared/app_utils.dart';
import '../../../data/shared/custom_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

import '../widgets/custom_appbar_home.dart';
import '../widgets/dia_dieta_tile.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  Map<String, List<RefeicaoModel>> _groupTransactionsByDate(List<RefeicaoModel> refeicoes) {
    refeicoes.sort((a, b) => b.data!.compareTo(a.data!));

    final Map<String, List<RefeicaoModel>> groupedRefeicoes = {};
    for (var transaction in refeicoes) {
      DateTime dateTime = transaction.data!;
      String formattedDate = AppUtils.alternativeFormattedDate(dateTime);
      if (!groupedRefeicoes.containsKey(formattedDate)) {
        groupedRefeicoes[formattedDate] = [];
      }
      groupedRefeicoes[formattedDate]!.add(transaction);
    }

    return groupedRefeicoes;
  }

  final List<RefeicaoModel> refeicoes = [
    RefeicaoModel(
      titulo: 'Cafe da manha',
      data: DateTime(2023, 10, 1, 20, 30),
      descricao: 'primeira refeiçao do dia',
      alimentos: [
        AlimentoModel(descricao: "pao", calorias: 1, carboidratos: 2, gorduras: 3, proteinas: 4),
        AlimentoModel(descricao: "arroz", calorias: 5, carboidratos: 6, gorduras: 7, proteinas: 8),
        AlimentoModel(descricao: "feijao", calorias: 9, carboidratos: 10, gorduras: 11, proteinas: 12),
        AlimentoModel(descricao: "frango", calorias: 13, carboidratos: 14, gorduras: 15, proteinas: 16),
        AlimentoModel(descricao: "salada", calorias: 17, carboidratos: 18, gorduras: 19, proteinas: 20),
      ],
      naDieta: false,
    ),
    RefeicaoModel(
      data: DateTime(2023, 10, 1, 8, 30),
      titulo: 'almoço',
      descricao: 'segunda refeiçao do dia',
      alimentos: [
        AlimentoModel(descricao: "macarrao", calorias: 21, carboidratos: 22, gorduras: 23, proteinas: 24),
        AlimentoModel(descricao: "carne", calorias: 25, carboidratos: 26, gorduras: 27, proteinas: 28),
        AlimentoModel(descricao: "batata", calorias: 29, carboidratos: 30, gorduras: 31, proteinas: 32),
        AlimentoModel(descricao: "cenoura", calorias: 33, carboidratos: 34, gorduras: 35, proteinas: 36),
      ],
      naDieta: true,
    ),
    RefeicaoModel(
      data: DateTime(2023, 10, 1, 9, 30),
      titulo: 'jantar',
      descricao: 'low carb',
      alimentos: [
        AlimentoModel(descricao: "sopa", calorias: 37, carboidratos: 38, gorduras: 39, proteinas: 40),
        AlimentoModel(descricao: "pao integral", calorias: 41, carboidratos: 42, gorduras: 43, proteinas: 44),
        AlimentoModel(descricao: "queijo", calorias: 45, carboidratos: 46, gorduras: 47, proteinas: 48),
        AlimentoModel(descricao: "presunto", calorias: 49, carboidratos: 50, gorduras: 51, proteinas: 52),
      ],
      naDieta: true,
    ),
    RefeicaoModel(
      data: DateTime(2023, 10, 4, 10, 30),
      titulo: 'Cafe da manha',
      descricao: 'menos carboideatos',
      alimentos: [
        AlimentoModel(descricao: "omelete", calorias: 53, carboidratos: 54, gorduras: 55, proteinas: 56),
        AlimentoModel(descricao: "tomate", calorias: 57, carboidratos: 58, gorduras: 59, proteinas: 60),
        AlimentoModel(descricao: "alface", calorias: 61, carboidratos: 62, gorduras: 63, proteinas: 64),
        AlimentoModel(descricao: "pepino", calorias: 65, carboidratos: 66, gorduras: 67, proteinas: 68),
      ],
      naDieta: true,
    ),
    RefeicaoModel(
      data: DateTime(2023, 10, 5, 11, 30),
      titulo: 'Cafe da manha',
      descricao: 'somente frutas',
      alimentos: [
        AlimentoModel(descricao: "iogurte", calorias: 69, carboidratos: 70, gorduras: 71, proteinas: 72),
        AlimentoModel(descricao: "granola", calorias: 73, carboidratos: 74, gorduras: 75, proteinas: 76),
        AlimentoModel(descricao: "banana", calorias: 77, carboidratos: 78, gorduras: 79, proteinas: 80),
        AlimentoModel(descricao: "morango", calorias: 81, carboidratos: 82, gorduras: 83, proteinas: 84),
      ],
      naDieta: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //  List<List<RefeicaoModel>> refeicoesAgrupadas = agruparRefeicoesPorData(refeicoes);
    final groupedTransactions = _groupTransactionsByDate(refeicoes);

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppBarHome(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: screenWidth,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Ícone no canto superior direito
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          PhosphorIcons.arrowUpRight,
                          size: 32.0,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ),

                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '90,86%',
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'das refeições dentro da dieta',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black54,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Refeições', style: Theme.of(context).textTheme.headlineSmall)),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: '+ Nova refeição',
                onPressed: () {
                  Get.toNamed(Routes.CADASTRAR_REFEICAO);
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: groupedTransactions.length,
                  itemBuilder: (context, index) {
                    final date = groupedTransactions.keys.elementAt(index);
                    final transactions = groupedTransactions[date]!;
                    return DiaDietaTile(
                      refeicoes: transactions,
                    );

                    // return RefeicaoResumidaTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
/* 
  @override
  Widget build(BuildContext context) {
    if (controller.cAuth.preencherUser == true) {
      Future.delayed(const Duration(seconds: 1), () {
        if (controller.pageController.hasClients) {
          controller.changePage(page: 2);
        }
      });
    } else {
      print(controller.cAuth.userLogado!.peso.toString());
    }
    return Scaffold(
      body: PageView(
          key: controller.formKeys[controller.currentIndex.value],
          onPageChanged: (s) {
            print(s);
          },
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [RefeicoesView(), AlimentosView(), InformacoesView(), MetasView()]),
      bottomNavigationBar: BottomBarHome(controller: controller),
    );
  } */
}
