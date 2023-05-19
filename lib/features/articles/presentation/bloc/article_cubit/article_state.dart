/*
import 'package:equatable/equatable.dart';
import '../../../domain/entities/article_entity.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleEmpty extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoading extends ArticleState {
  final ArticleDataEntity articleDataEntity;

  const ArticleLoading(this.articleDataEntity);

  @override
  List<Object> get props => [articleDataEntity];
}

class ArticleLoaded extends ArticleState {
  final ArticleDataEntity articleDataEntity;

  const ArticleLoaded(this.articleDataEntity);

  @override
  List<Object> get props => [articleDataEntity];
}

class ArticleError extends ArticleState {
  final String message;

  const ArticleError({required this.message});

  @override
  List<Object> get props => [message];
}
*/

import 'package:equatable/equatable.dart';
import 'package:hidoc/features/articles/domain/entities/article_entity.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleEmpty extends ArticleState {
  @override
  List<Object> get props => [];
}

class ArticleLoading extends ArticleState {
  final ArticleDataEntity oldArticle;

  const ArticleLoading(this.oldArticle);

  @override
  List<Object> get props => [oldArticle];
}

class ArticleLoaded extends ArticleState {
  final ArticleDataEntity article;

  const ArticleLoaded(this.article);

  @override
  List<Object> get props => [article];
}

class ArticleError extends ArticleState {
  final String message;

  const ArticleError({required this.message});

  @override
  List<Object> get props => [message];
}
