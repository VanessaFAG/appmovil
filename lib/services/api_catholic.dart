import 'package:dio/dio.dart';
import 'package:movil2025/utils/app_strings.dart';
import 'package:async/async.dart';

class ApiCatholic {
  
  Dio dio = Dio();

  Future<List<?>> getCategory(int idCategory) async{
    String url = "${AppStrings.url_base}api/category/$idCategory";
    final response = await dio.get(url);
    final res = response.data['series'];
    return res.map((series) => SeriesDao.fromMap(series)).toList;
  }

  Future <List<SeriesDao>> getAllCategories() async{
    final FutureGroup<List<SeriesDao>> futureGroup = FutureGroup();
    futureGroup.add getCategory(2);
    futureGroup.add getCategory(3);
    futureGroup.add getCategory(4);
    futureGroup.add getCategory(5);
    futureGroup.add getCategory(6);
    futureGroup.close();
    
    List<SeriesDao> listSeries = List<SeriesDao>.empty(growable: true);
    final List<SeriesDao> resutls = await futureGroup.future;
    for (var series in resutls) {
      listSeries.addAll(series);
    }
  }

  

}