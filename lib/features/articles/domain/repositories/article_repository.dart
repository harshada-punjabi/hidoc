
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/article_entity.dart';

abstract class ArticleRepository {
  Future<Either<Failure, ArticleDataEntity>> getResponse();
}
