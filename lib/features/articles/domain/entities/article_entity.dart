import 'package:equatable/equatable.dart';

class ArticleDataEntity extends Equatable {
  final int success;
  final String message;
  final DataEntity data;
  final String timestamp;




  const ArticleDataEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.timestamp,

  });

  @override
  List<Object?> get props => [
    success,
    message,
    data,
    timestamp,

  ];
}
class ArticleEntity extends Equatable{
   int id;
  final String articleTitle;
  final String articleImg;
  final String articleDescription;
  final String specialityId;
  final int rewardPoints;
  final dynamic keywordsList;
  final dynamic articleUniqueId;
  final int articleType;
  final String createdAt;
  ArticleEntity({
     required this.id,
    required this.articleTitle,
    required this.articleImg,
    required this.articleDescription,
    required this.specialityId,
    required this.rewardPoints,
    required this.keywordsList,
    required this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,articleDescription,
    articleImg,articleTitle,
    specialityId,rewardPoints,
    keywordsList,articleType,
    createdAt,articleUniqueId];

  toJson() {}
}

class DataEntity {
  List<NewsEntity>? news;
  List<TrendingBulletinEntity>? trandingBulletin;
   String? specialityName;
   List<LatestArticleEntity>? latestArticle;
   List<ExploreArticleEntity>? exploreArticle;
   List<TrendingArticleEntity>? trandingArticle;
   ArticleEntity? article;
   List<BulletinEntity>? bulletin;
   int? sId;
  DataEntity({
     this.news,
     this.trandingBulletin,
     this.specialityName,
     this.exploreArticle,
     this.latestArticle,
     this.trandingArticle,
     this.article,
     this.bulletin,
     this.sId,

  });
}

class NewsEntity {
  final String id ;
  final String title;
  final String urlToImage;
  final String description;
  final String speciality;
  final String newsUniqueId;
  final int trendingLatest;
  final String publishedAt;
  NewsEntity({
    required this.id,
    required this.title,
    required this.urlToImage,
    required this.description,
    required this.speciality,
    required this.newsUniqueId,
    required this.trendingLatest,
    required this.publishedAt,

  });

  toJson() {}
}

class TrendingBulletinEntity {
  final int id;
  final String articleTitle;
  final String articleImg;
  final String articleDescription;
  final dynamic specialityId;
  final int rewardPoints;
  final dynamic keywordsList;
  final dynamic articleUniqueId;
  final int articleType;
  final dynamic createdAt;
  TrendingBulletinEntity({
    required this.id,
    required this.articleTitle,
    required this.articleImg,
    required this.articleDescription,
    required this.specialityId,
    required this.rewardPoints,
    required this.keywordsList,
    required this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  toJson() {}
}
class ExploreArticleEntity {
  final int id;
  final String articleTitle;
  final String articleImg;
  final String articleDescription;
  final dynamic specialityId;
  final int rewardPoints;
  final dynamic keywordsList;
  final dynamic articleUniqueId;
  final int articleType;
  final dynamic createdAt;
  ExploreArticleEntity({
    required this.id,
    required this.articleTitle,
    required this.articleImg,
    required this.articleDescription,
    required this.specialityId,
    required this.rewardPoints,
    required this.keywordsList,
    required this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  toJson() {}
}
class LatestArticleEntity {
  toJson() {}
}
class BulletinEntity {
  final int id;
  final String articleTitle;
  final String articleImg;
  final String articleDescription;
  final String specialityId;
  final int rewardPoints;
  final String keywordsList;
  final String articleUniqueId;
  final int articleType;
  final String createdAt;
  BulletinEntity({
    required this.id,
    required this.articleTitle,
    required this.articleImg,
    required this.articleDescription,
    required this.specialityId,
    required this.rewardPoints,
    required this.keywordsList,
    required this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  toJson() {}
}
class TrendingArticleEntity {
  final int id;
  final String articleTitle;
  final String articleImg;
  final String articleDescription;
  final String specialityId;
  final int rewardPoints;
  final String keywordsList;
  final String articleUniqueId;
  final int articleType;
  final String createdAt;
  TrendingArticleEntity({
    required this.id,
    required this.articleTitle,
    required this.articleImg,
    required this.articleDescription,
    required this.specialityId,
    required this.rewardPoints,
    required this.keywordsList,
    required this.articleUniqueId,
    required this.articleType,
    required this.createdAt,
  });

  toJson() {}
}




