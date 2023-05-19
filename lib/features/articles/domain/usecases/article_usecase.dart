import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/article_entity.dart';
import '../repositories/article_repository.dart';


class GetResponse {
  final ArticleRepository articleRepository;

  GetResponse(this.articleRepository);

  Future<Either<Failure, ArticleDataEntity>> getArticleBy() async {

    return await articleRepository.getResponse();
  }
}
