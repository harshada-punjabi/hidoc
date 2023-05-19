
import 'package:dartz/dartz.dart';


import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/repositories/article_repository.dart';
import '../datasources/article_remote_data_source.dart';
import '../models/article_model.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;
  ArticleRepositoryImpl({
    required this.remoteDataSource,

  });
  @override
  Future<Either<Failure, ArticleDataEntity>> getResponse() async {
    return await _getResponse(() {
      return remoteDataSource.getResponse();
    });
  }


  Future<Either<Failure, ArticleDataEntity>> _getResponse(
      Future<ArticleDataModel> Function() getArticles) async {
      try {
        final remoteArticle = await getArticles();
        return Right(remoteArticle);
      } on ServerExeption {
        return Left(ServerFailure());
      }

  }

}
