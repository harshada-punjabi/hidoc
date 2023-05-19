
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/articles/data/datasources/article_remote_data_source.dart';
import 'features/articles/data/repositories/article_repository_impl.dart';
import 'features/articles/domain/repositories/article_repository.dart';
import 'features/articles/domain/usecases/article_usecase.dart';
import 'features/articles/presentation/bloc/article_cubit/article_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
        () => ArticleCubit(getResponse: sl()),
  );
  // UseCases
  sl.registerLazySingleton(() => GetResponse(sl()));
  // Repository
  sl.registerLazySingleton<ArticleRepository>(
        () => ArticleRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ArticleRemoteDataSource>(
        () => ArticleRemoteDataSourceImp(client: sl()),
  );
  // External
  sl.registerLazySingleton(() => http.Client());

}
