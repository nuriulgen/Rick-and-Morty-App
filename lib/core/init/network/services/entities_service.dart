import 'package:dio/dio.dart';
import '../../../../product/constants/exception/end_list_exception.dart';
import '../../../../product/constants/exception/no_network_exception.dart';

import '../model/info_model.dart';

abstract class EntitiesService {
  static final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchEntities(String url) async {
    try {
      List<Map<String, dynamic>> allEntities = [];
      String? nextUrl = url;
      while (nextUrl != null) {
        var response = await _dio.get(nextUrl);
        try {
          var dataInfo = response.data["info"];
          Info info = Info.fromJson(dataInfo);
          nextUrl = info.next;
          var dataResults = response.data["results"];
          allEntities.addAll(List<Map<String, dynamic>>.from(dataResults));
        } catch (e) {
          allEntities.addAll(List<Map<String, dynamic>>.from(response.data));
          nextUrl = null;
        }
      }
      return allEntities;
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 404) {
          throw Exception(EndListException);
        } else {
          throw Exception(
              "${exception.response!.statusCode}: ${exception.response!.statusMessage}");
        }
      } else {
        throw Exception(NoNetworkException);
      }
    }
  }
}
