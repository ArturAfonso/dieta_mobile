import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../data/shared/custom_button.dart';
import '../../refeicoes/widgets/refeicao_detalhada_tile.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_appbar_home.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              const CustomButton(
                text: '+ Nova refeição',
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.refeicoes.length,
                  itemBuilder: (context, index) {
                    return RefeicaoDetalhadaTile(index: index);

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
