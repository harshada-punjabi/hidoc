import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/article_entity.dart';
import '../../../domain/usecases/article_usecase.dart';
import 'article_state.dart';
import 'package:intl/intl.dart';



class ArticleCubit extends Cubit<ArticleState> {
  final GetResponse getResponse;
  ArticleCubit({required this.getResponse}) : super(ArticleEmpty());
  ArticleDataEntity oldArticle = ArticleDataEntity(
      success: 5,
      message: 'static',
      data: DataEntity(
          news: [],
          trandingArticle: [],
          trandingBulletin: [],
          sId: 2,
          specialityName: '',
          exploreArticle: [],
          latestArticle: [],
          bulletin: [],
          article: ArticleEntity(
              articleTitle: '',
              articleImg: '',
              articleDescription: '',
              specialityId: '',
              rewardPoints: 3,
              keywordsList: '',
              articleUniqueId: '',
              articleType: 5,
              createdAt: '',
              id: 5)
          ),
      timestamp: '');
  List<BulletinEntity>? bulletinList = [];
  void loadArticle() async {
    if (state is ArticleLoading) return;
    final currentState = state;
    if (currentState is ArticleLoaded) {
      oldArticle = currentState.article;
    }

    emit(ArticleLoading(oldArticle));

    final failureOrArticle = await getResponse.getArticleBy();

    failureOrArticle.fold(
        (error) => emit(ArticleError(message: _mapFailurToMessage(error))),
        (character) {
      var articles = (state as ArticleLoading).oldArticle;
      oldArticle = character;
      bulletinList = character.data.bulletin;
      articles = character;
      emit(ArticleLoaded(articles));
    });
  }

  String formatDate(String dateString) {
    final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final outputFormat = DateFormat('dd MMMM yyyy');

    final DateTime dateTime = inputFormat.parse(dateString);
    final String formattedDate = outputFormat.format(dateTime);

    return formattedDate;
  }

  String _mapFailurToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
