
import '../../domain/entities/article_entity.dart';
import 'news_model.dart';


class ArticleDataModel extends ArticleDataEntity {
  const ArticleDataModel({
    required success,
    required message,
    required data,
    required timestamp,

  }) : super(
    success: success,
    message: message,
    data: data,
    timestamp: timestamp,
  );


  factory ArticleDataModel.fromJson(Map<String, dynamic> json) {
    return ArticleDataModel(
      success: json['success'] as int,
      message: json['message'] as String,
      data:json['data'] != null ?  DataModel.fromJson(json['data']): null,
      timestamp: json['timestamp'] as String

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = DataModel().toJson();
    data['timestamp'] = timestamp;
    return data;
  }
}
