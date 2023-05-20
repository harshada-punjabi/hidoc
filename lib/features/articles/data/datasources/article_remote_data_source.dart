import 'dart:convert';
import 'package:hidoc/core/error/exception.dart';


// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../models/article_model.dart';


abstract class ArticleRemoteDataSource {
  /// Calls the http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid? endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ArticleDataModel> getResponse();
}

class ArticleRemoteDataSourceImp implements ArticleRemoteDataSource {
  final http.Client client;

  ArticleRemoteDataSourceImp({required this.client});
  @override
  Future<ArticleDataModel> getResponse() async{
   return  await _getArticleFromUrl() ;
  }
  Future<ArticleDataModel> _getArticleFromUrl() async {
    final response = await client
        .post(Uri.parse( 'http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid?'),
        headers: {
          // 'Access-Control-Allow-Origin':'*'
        },
        body: {
          'sId': '500',
          'uuId': '',
          'userId': '423914',
        }
    );
    if (response.statusCode == 200) {
      final article = jsonDecode(response.body);
      ArticleDataModel articleDataModel = ArticleDataModel.fromJson(article);
      // DataModel.fromJson(json['data']
      return articleDataModel;
    } else {
      throw ServerExeption();
    }
  }
}
