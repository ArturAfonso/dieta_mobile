import 'package:get/get.dart';

import '../modules/alimentos/bindings/alimentos_binding.dart';
import '../modules/alimentos/views/alimentos_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informacoes/bindings/informacoes_binding.dart';
import '../modules/informacoes/views/informacoes_view.dart';
import '../modules/metas/bindings/metas_binding.dart';
import '../modules/metas/views/metas_view.dart';
import '../modules/refeicoes/bindings/refeicoes_binding.dart';
import '../modules/refeicoes/views/refeicoes_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REFEICOES,
      page: () => const RefeicoesView(),
      binding: RefeicoesBinding(),
    ),
    GetPage(
      name: _Paths.ALIMENTOS,
      page: () => const AlimentosView(),
      binding: AlimentosBinding(),
    ),
    GetPage(
      name: _Paths.INFORMACOES,
      page: () => const InformacoesView(),
      binding: InformacoesBinding(),
    ),
    GetPage(
      name: _Paths.METAS,
      page: () => const MetasView(),
      binding: MetasBinding(),
    ),
  ];
}
