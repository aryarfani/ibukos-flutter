import 'package:dio/dio.dart';
import 'package:ibukos/core/models/kos_model.dart';
import 'package:ibukos/core/services/base_service.dart';

class KosService extends BaseService {
  Future getKos() async {
    Response resp = await dio.get('api.php');
    if (resp.statusCode == 200) {
      return kosModelFromJson(resp.data);
    }
  }
}
