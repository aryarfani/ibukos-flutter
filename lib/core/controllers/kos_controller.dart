import 'package:get/get.dart';
import 'package:ibukos/core/models/kos_model.dart';
import 'package:ibukos/core/services/kos_service.dart';

class KosController extends GetxController {
  static KosController get to => Get.find();

  List<KosModel> listKos;
  KosService _kosService = KosService();

  // Search Properti
  List<KosModel> pureListKos;

  void getKosList() async {
    listKos = await _kosService.getKos();
    update();
  }

  void searchKos(String query) {
    if (pureListKos == null) {
      pureListKos = listKos;
    }

    listKos = pureListKos.where((el) => el.nama.toLowerCase().contains(query)).toList();

    if (query.trim().isEmpty) {
      listKos.addAll(pureListKos);
    }

    update();
  }
}
