
import 'dart:convert';

import '../../domain/entities/article_entity.dart';

class DataModel extends DataEntity {
  DataModel({
    news,
    trandingBulletin,
    specialityName,
    latestArticle,
    exploreArticle,
    trandingArticle,
    article,
    bulletin,
    sId,
  }) : super(
    news: news,
    //aliases:aliases,
    trandingBulletin: trandingBulletin,
    specialityName: specialityName,
    latestArticle: latestArticle,
    exploreArticle: exploreArticle,
    trandingArticle: trandingArticle,
    article: article,
    bulletin: bulletin,
    sId: sId
  );
  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news =  <NewsModel>[];
      json['news'].forEach((v) {
        news!.add( NewsModel.fromJson(v));
      });
    }
    if (json['trandingBulletin'] != null) {
      trandingBulletin = <TrendingBulletinModel>[];
      json['trandingBulletin'].forEach((v) {
        trandingBulletin!.add(TrendingBulletinModel.fromJson(v));
      });
    }
    specialityName = json['specialityName'];
    if (json['latestArticle'] != null) {
      latestArticle = <LatestArticleModel>[];
    }
    if (json['exploreArticle'] != null) {
      exploreArticle = <ExploreArticleModel>[];
      json['exploreArticle'].forEach((v) {
        exploreArticle!.add( ExploreArticleModel.fromJson(v));
      });
    }
    if (json['trandingArticle'] != null) {
      trandingArticle = <TrandingArticleModel>[];
      json['trandingArticle'].forEach((v) {
        trandingArticle!.add( TrandingArticleModel.fromJson(v));
      });
    }
    // article = jsonDecode(json['article']);
    if (json['bulletin'] != null) {
      bulletin = <BulletinModel>[];
      json['bulletin'].forEach((v) {
        bulletin!.add(BulletinModel.fromJson(v));
      });
    }
    sId = json['sId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    if (trandingBulletin != null) {
      data['trandingBulletin'] =
          trandingBulletin!.map((v) => v.toJson()).toList();
    }
    data['specialityName'] = specialityName;
    if (latestArticle != null) {
      data['latestArticle'] =
          latestArticle!.map((v) => v.toJson()).toList();
    }
    if (exploreArticle != null) {
      data['exploreArticle'] =
          exploreArticle!.map((v) => v.toJson()).toList();
    }
    if (trandingArticle != null) {
      data['trandingArticle'] =
          trandingArticle!.map((v) => v.toJson()).toList();
    }
    if (article != null) {
      data['article'] = article!.toJson();
    }
    if (bulletin != null) {
      data['bulletin'] = bulletin!.map((v) => v.toJson()).toList();
    }
    data['sId'] = sId;
    return data;
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'news': List<Map<String,dynamic>>.from(news.map((news1) => news1.toJson())),
  //     //'aliases':aliases,
  //     'trandingBulletin': trandingBulletin,
  //     'specialityName': specialityName,
  //     'latestArticle': latestArticle,
  //     'exploreArticle': exploreArticle,
  //     'trandingArticle': trandingArticle,
  //     'article': article,
  //     'bulletin': bulletin,
  //     'sId': sId,
  //   };
  // }
}
class NewsModel extends NewsEntity {
  NewsModel({
    id,
    //aliases,
    title,
    urlToImage,
    description,
    newsUniqueId,
    trendingLatest,
    publishedAt,
    speciality,
  }) : super(
    id: id,
    //aliases:aliases,
    title: title,
    urlToImage: urlToImage,
    description: description,
    newsUniqueId: newsUniqueId,
    trendingLatest: trendingLatest,
    publishedAt: publishedAt,
    speciality: speciality,
  );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      urlToImage: json['urlToImage'] as String,
      description: json['description'] as String,
      newsUniqueId: json['newsUniqueId'] as String,
      trendingLatest: json['trendingLatest'] as int,
      publishedAt: json['publishedAt'] as String,
      speciality: json['speciality'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      //'aliases':aliases,
      'title': title,
      'urlToImage': urlToImage,
      'description': description,
      'newsUniqueId': newsUniqueId,
      'trendingLatest': trendingLatest,
      'publishedAt': publishedAt,
      'speciality': speciality,
    };
  }
}


class TrendingBulletinModel extends TrendingBulletinEntity {
  TrendingBulletinModel({
    id,
    //aliases,
    articleTitle,
    articleImg,
    articleDescription,
    specialityId,
    rewardPoints,
    keywordsList,
    articleUniqueId,
    articleType,
    createdAt,
  }) : super(
    id: id,
    //aliases:aliases,
    articleTitle: articleTitle,
    articleImg: articleImg,
    articleDescription: articleDescription,
    specialityId: specialityId,
    rewardPoints: rewardPoints,
    keywordsList: keywordsList,
    articleUniqueId: articleUniqueId,
    articleType: articleType,
    createdAt: createdAt,
  );

  factory TrendingBulletinModel.fromJson(Map<String, dynamic> json) {
    return TrendingBulletinModel(
      id: json['id'] as int,
      articleTitle: json['articleTitle'] as String,
      articleImg: json['articleImg'] as String,
      articleDescription: json['articleDescription'] as String,
      specialityId: json['specialityId'] as dynamic,
      rewardPoints: json['rewardPoints'] as int,
      keywordsList: json['keywordsList'] as dynamic,
      articleUniqueId: json['articleUniqueId'] as dynamic,
      articleType: json['articleType'] as int,
      createdAt: json['createdAt'] as dynamic,

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      //'aliases':aliases,
      'articleTitle': articleTitle,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}
class LatestArticleModel extends LatestArticleEntity {
//list is empty in backend
}
class ExploreArticleModel extends ExploreArticleEntity {
  ExploreArticleModel({
    id,
    //aliases,
    articleTitle,
    articleImg,
    articleDescription,
    specialityId,
    rewardPoints,
    keywordsList,
    articleUniqueId,
    articleType,
    createdAt,
  }) : super(
    id: id,
    //aliases:aliases,
    articleTitle: articleTitle,
    articleImg: articleImg,
    articleDescription: articleDescription,
    specialityId: specialityId,
    rewardPoints: rewardPoints,
    keywordsList: keywordsList,
    articleUniqueId: articleUniqueId,
    articleType: articleType,
    createdAt: createdAt,
  );

  factory ExploreArticleModel.fromJson(Map<String, dynamic> json) {
    return ExploreArticleModel(
      id: json['id'] as int,
      articleTitle: json['articleTitle'] as String,
      articleImg: json['articleImg'] as String,
      articleDescription: json['articleDescription'] as String,
      specialityId: json['specialityId'] as dynamic,
      rewardPoints: json['rewardPoints'] as int,
      keywordsList: json['keywordsList'] as dynamic,
      articleUniqueId: json['articleUniqueId'] as dynamic,
      articleType: json['articleType'] as int,
      createdAt: json['createdAt'] as dynamic,

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleTitle': articleTitle,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}
class TrandingArticleModel extends TrendingArticleEntity {
  TrandingArticleModel({
    id,
    //aliases,
    articleTitle,
    articleImg,
    articleDescription,
    specialityId,
    rewardPoints,
    keywordsList,
    articleUniqueId,
    articleType,
    createdAt,
  }) : super(
    id: id,
    articleTitle: articleTitle,
    articleImg: articleImg,
    articleDescription: articleDescription,
    specialityId: specialityId,
    rewardPoints: rewardPoints,
    keywordsList: keywordsList,
    articleUniqueId: articleUniqueId,
    articleType: articleType,
    createdAt: createdAt,
  );

  factory TrandingArticleModel.fromJson(Map<String, dynamic> json) {
    return TrandingArticleModel(
      id: json['id'] as int,
      articleTitle: json['articleTitle'] as String,
      articleImg: json['articleImg'] as String,
      articleDescription: json['articleDescription'] as String,
      specialityId: json['specialityId'].toString() ,
      rewardPoints: json['rewardPoints'] as int,
      keywordsList: json['keywordsList'].toString() ,
      articleUniqueId: json['articleUniqueId'].toString() ,
      articleType: json['articleType'] as int,
      createdAt: json['createdAt'].toString(),

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      //'aliases':aliases,
      'articleTitle': articleTitle,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}
class ArticleModel extends ArticleEntity {
  ArticleModel({
    id,
    articleTitle,
    articleImg,
    articleDescription,
    specialityId,
    rewardPoints,
    keywordsList,
    articleUniqueId,
    articleType,
    createdAt,
  }) : super(
    id: id,
    articleTitle: articleTitle,
    articleImg: articleImg,
    articleDescription: articleDescription,
    specialityId: specialityId,
    rewardPoints: rewardPoints,
    keywordsList: keywordsList,
    articleUniqueId: articleUniqueId,
    articleType: articleType,
    createdAt: createdAt,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as int,
      articleTitle: json['articleTitle'] as String,
      articleImg: json['articleImg'] as String,
      articleDescription: json['articleDescription'] as String,
      specialityId: json['specialityId'] as dynamic,
      rewardPoints: json['rewardPoints'] as int,
      keywordsList: json['keywordsList'] as dynamic,
      articleUniqueId: json['articleUniqueId'] as dynamic,
      articleType: json['articleType'] as int,
      createdAt: json['createdAt'] as dynamic,

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleTitle': articleTitle,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}
class BulletinModel extends BulletinEntity {
  BulletinModel({
    id,
    articleTitle,
    articleImg,
    articleDescription,
    specialityId,
    rewardPoints,
    keywordsList,
    articleUniqueId,
    articleType,
    createdAt,
  }) : super(
    id: id,
    //aliases:aliases,
    articleTitle: articleTitle,
    articleImg: articleImg,
    articleDescription: articleDescription,
    specialityId: specialityId,
    rewardPoints: rewardPoints,
    keywordsList: keywordsList,
    articleUniqueId: articleUniqueId,
    articleType: articleType,
    createdAt: createdAt,
  );

  factory BulletinModel.fromJson(Map<String, dynamic> json) {
    return BulletinModel(
      id: json['id'] as int,
      articleTitle: json['articleTitle'] as String,
      articleImg: json['articleImg'] as String,
      articleDescription: json['articleDescription'] as String,
      specialityId: json['specialityId'].toString() ,
      rewardPoints: json['rewardPoints'] as int,
      keywordsList: json['keywordsList'].toString() ,
      articleUniqueId: json['articleUniqueId'].toString() ,
      articleType: json['articleType'] as int,
      createdAt: json['createdAt'].toString(),

    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      //'aliases':aliases,
      'articleTitle': articleTitle,
      'articleImg': articleImg,
      'articleDescription': articleDescription,
      'specialityId': specialityId,
      'rewardPoints': rewardPoints,
      'keywordsList': keywordsList,
      'articleUniqueId': articleUniqueId,
      'articleType': articleType,
      'createdAt': createdAt,
    };
  }
}
