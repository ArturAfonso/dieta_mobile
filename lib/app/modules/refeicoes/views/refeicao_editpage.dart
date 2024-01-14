import 'package:dieta_mobile/app/modules/refeicoes/controllers/refeicoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefeicaoEditpage extends GetView<RefeicoesController> {
  const RefeicaoEditpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Editar Refeição',
          // style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.size.height,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _showSelectImage(context);
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Get.theme.colorScheme.onPrimaryContainer,
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Text(
                        'Adicionar imagem',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.theme.colorScheme.primary,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                          onPressed: () {
                            // Lógica para ação do botão de câmera
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(child: MyForm()),
          ],
        ),
      ),
    );
  }

  void _showSelectImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Importar imagem',
              style: TextStyle(color: Get.theme.primaryColor),
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Adicione a função desejada para a câmera aqui
                    print('Câmera pressionada');
                  },
                  child: Container(
                    height: Get.size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text('Tirar foto'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Adicione a função desejada para a galeria aqui
                    print('Galeria pressionada');
                  },
                  child: Container(
                    height: Get.size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text('Galeria'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Primeiro Nome',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextFormField(),
        const SizedBox(height: 20),
        const Text(
          'Itens da Refeição',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Flexible(
          child: ListView(
            children: const [
              ListTile(title: Text('Alimento 1')),
              ListTile(title: Text('Alimento 2')),
              ListTile(title: Text('Alimento 3')),
              ListTile(title: Text('Alimento 4')),
              ListTile(title: Text('Alimento 5')),
            ],
          ),
        ),
      ],
    );
  }
}
