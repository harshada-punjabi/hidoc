import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/features/articles/presentation/bloc/article_cubit/article_state.dart';
import 'dart:io';
import 'package:hidoc/locator_service.dart' as di;

import 'features/articles/presentation/bloc/article_cubit/article_cubit.dart';
import 'features/articles/presentation/views/article_view.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleCubit>(
            create: (context) => sl<ArticleCubit>()..loadArticle()),
      ],
      child: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          return MaterialApp(

            home: ArticleView(),
          );
        },
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}