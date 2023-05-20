import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidoc/features/articles/domain/entities/article_entity.dart';

import '../bloc/article_cubit/article_cubit.dart';
import '../bloc/article_cubit/article_state.dart';

class ArticleView extends StatelessWidget {
  final bulletinScrollController = ScrollController();
  final trendingBulletinScrollController = ScrollController();

  ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myBloc = BlocProvider.of<ArticleCubit>(context);

    return BlocBuilder<ArticleCubit, ArticleState>(
        builder: (BuildContext context, state) {
      ArticleDataEntity article = myBloc.oldArticle;
      if (state is ArticleLoading) {
        return _loadingIndicator();
      } else if (state is ArticleLoaded) {
        article = state.article;
      } else if (state is ArticleError) {
        return Text(
          state.message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        );
      }

      return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: kIsWeb
                ? const BoxDecoration()
                : const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    kIsWeb
                        ? const SizedBox()
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                    kIsWeb
                        ? const SizedBox()
                        : Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'hidoc',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                    kIsWeb ? const SizedBox() : const SizedBox(height: 10),
                    const Text(
                      "Articles",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: kIsWeb
                              ? MediaQuery.of(context).size.width * 0.4
                              : MediaQuery.of(context).size.width * 0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: const Card(
                              color: Colors.white,
                              child: ListTile(
                                trailing: Icon(Icons.arrow_drop_down),
                                title: Center(
                                  child: Text(
                                    'Critical care',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: kIsWeb
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            color: Colors.grey.withOpacity(0.4),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.36,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                            child: const Center(
                                              child: Icon(
                                                  Icons.newspaper_outlined,
                                                  color: Colors.grey,
                                                  size: 120),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              // color: Colors.blue.shade300,
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade300,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  // topLeft: Radius.circular(10),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'Points',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    '2',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                article.data.news!.first.title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                article.data.news!.first
                                                    .description,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Read full article to earn points',
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Published Date: ',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  myBloc.formatDate(
                                                    article.data.news!.first
                                                        .publishedAt,
                                                  ),
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(40.0),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.grey.withOpacity(0.4),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.18,
                                            child: const Center(
                                              child: Icon(
                                                  Icons.newspaper_outlined,
                                                  color: Colors.grey,
                                                  size: 120),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      article.data.news!.first
                                                          .title,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      article.data.news!.first
                                                          .description,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Read full article to earn points',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 60,
                                                        width: 60,
                                                        color: Colors
                                                            .blue.shade300,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Text(
                                                              'Points',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            Text(
                                                              '2',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        kIsWeb
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Divider(),
                              )
                            : const SizedBox(),
                        kIsWeb
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'Hidoc Bulletin',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: kIsWeb ? 20 : 30),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        _bulletinListBuilder(
                                            article.data.bulletin),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: _trendingBulletinListBuilder(
                                          article.data.trandingBulletin)),
                                ],
                              )
                            : const SizedBox(),
                        kIsWeb
                            ? const SizedBox()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Hidoc Bulletin',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: kIsWeb ? 20 : 30),
                                    ),
                                  ),
                                ],
                              ),
                        kIsWeb
                            ? const SizedBox(
                                height: 20,
                              )
                            : SizedBox(),
                        kIsWeb
                            ? const SizedBox()
                            : _bulletinListBuilder(article.data.bulletin),
                        kIsWeb
                            ? const SizedBox()
                            : _trendingBulletinListBuilder(
                                article.data.trandingBulletin),
                        const SizedBox(
                          height: 20,
                        ),
                        _readMoreBulletinsButton(
                            context, 'Read More Bulletins'),
                        const SizedBox(
                          height: 20,
                        ),
                        kIsWeb
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: _latestArticle(
                                          context, article.data.latestArticle)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: _trendingArticle(context,
                                          article.data.trandingArticle)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      _exploreArticle(
                                          context, article.data.exploreArticle),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      _readMoreBulletinsButton(
                                          context, 'Explore Hidoc Dr'),
                                    ],
                                  )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  _latestArticle(
                                      context, article.data.latestArticle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _trendingArticle(
                                      context, article.data.trandingArticle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _exploreArticle(
                                      context, article.data.exploreArticle),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                        //  _latestArticle(context, article.data.latestArticle),
                        //  const SizedBox(height: 20,),
                        //  _trendingArticle(context, article.data.trandingArticle),
                        // const  SizedBox(height: 20,),
                        //  _exploreArticle(context, article.data.exploreArticle),
                        // const  SizedBox(height: 20,),
                        //
                        //  _readMoreBulletinsButton(context, 'Explore Hidoc Dr'),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "What's more on Hidoc Dr.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        kIsWeb
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: _newsArticle(
                                          context, article.data.news)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: _listTile(
                                    context,
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  _newsArticle(context, article.data.news),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _listTile(
                                    context,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 30,
                        ),

                        Container(
                          color: kIsWeb
                              ? Colors.blue.shade300.withOpacity(0.4)
                              : Colors.orange.shade300.withOpacity(0.4),
                          child: ListTile(
                            title: const Text(
                              'Social Network for doctors- A special feature on Hidoc Dr',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: kIsWeb
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.blue.shade300)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.orange.shade300),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        16), // Set button border radius
                                  ),
                                ),
                              ),
                              child: const Text('vist'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _bulletinListBuilder(List<BulletinEntity>? bulletinList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index < bulletinList.length) {
          return Container(
            color: index == 0 ? Colors.grey.withOpacity(0.4) : Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _divider(context),
                Text(
                  bulletinList[index].articleTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    bulletinList[index].articleDescription,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Read More',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          Timer(const Duration(milliseconds: 30), () {
            bulletinScrollController
                .jumpTo(bulletinScrollController.position.maxScrollExtent);
          });
          return _loadingIndicator();
        }
      },
      itemCount: bulletinList!.length,
    );
  }

  Widget _trendingBulletinListBuilder(
      List<TrendingBulletinEntity>? trendingBulletinList) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade200.withOpacity(0.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  ' Trending Hidoc Bulletin',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < trendingBulletinList.length) {
                return Column(
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            trendingBulletinList[index].articleTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        trendingBulletinList[index].articleDescription,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Read More',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  trendingBulletinScrollController.jumpTo(
                    trendingBulletinScrollController.position.maxScrollExtent,
                  );
                });
                return _loadingIndicator();
              }
            },
            itemCount: trendingBulletinList!.length,
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: kIsWeb
              ? MediaQuery.of(context).size.width * 0.1
              : MediaQuery.of(context).size.width * 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              child: Divider(
                color: Theme.of(context).primaryColor,
                thickness: kIsWeb ? 5 : 8.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _readMoreBulletinsButton(BuildContext context, String text) =>
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: kIsWeb
            ? MediaQuery.of(context).size.width * 0.40
            : MediaQuery.of(context).size.width * 0.72,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: kIsWeb
                ? MaterialStateProperty.all<Color>(Colors.blue.shade700)
                : MaterialStateProperty.all<Color>(Colors.orange.shade700),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ),
      );
  Widget _latestArticle(
      BuildContext context, List<LatestArticleEntity>? latestArticleList) {
    return Container(
      // height: MediaQuery.of(context).size.height *0.3,
      width: kIsWeb
          ? MediaQuery.of(context).size.width * 0.3
          : MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Set the border color
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Latest Article',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < latestArticleList.length) {
                return Column(
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            latestArticleList[index].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        latestArticleList[index].toString(),
                        style: const TextStyle(fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Read More',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  trendingBulletinScrollController.jumpTo(
                    trendingBulletinScrollController.position.maxScrollExtent,
                  );
                });
                return _loadingIndicator();
              }
            },
            itemCount: latestArticleList!.length,
          ),
        ],
      ),
    );
  }

  Widget _trendingArticle(
      BuildContext context, List<TrendingArticleEntity>? trendingArticlList) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Set the border color
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Trending Article',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < trendingArticlList.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Divider(
                        thickness: index == 0 ? 2 : 1,
                      ),
                      index == 0
                          ? Column(
                              children: [
                                Container(
                                  color: Colors.grey,
                                  child: Image.network(
                                      trendingArticlList[index].articleImg),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        trendingArticlList[index].articleTitle,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : ListTile(
                              leading: Image.network(
                                  trendingArticlList[index].articleImg),
                              title: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      trendingArticlList[index].articleTitle,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                );
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  trendingBulletinScrollController.jumpTo(
                    trendingBulletinScrollController.position.maxScrollExtent,
                  );
                });
                return _loadingIndicator();
              }
            },
            itemCount: trendingArticlList!.length,
          ),
        ],
      ),
    );
  }

  Widget _exploreArticle(
      BuildContext context, List<ExploreArticleEntity>? exploreArticleList) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Set the border color
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Explore More Article',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < exploreArticleList.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Divider(
                        thickness: index == 0 ? 2 : 1,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              exploreArticleList[index].articleTitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  trendingBulletinScrollController.jumpTo(
                    trendingBulletinScrollController.position.maxScrollExtent,
                  );
                });
                return _loadingIndicator();
              }
            },
            itemCount: exploreArticleList!.length,
          ),
        ],
      ),
    );
  }

  Widget _listTile(
    BuildContext context,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Set the border color
        borderRadius: BorderRadius.circular(10), // Set the border radius
      ),
      child: Column(
        children: [
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade300.withOpacity(0.4),
                  child: const Icon(Icons.card_giftcard),
                ),
                title: Row(
                  children: const [
                    Text(
                      'Quizess:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Participate and Win Exciting Prizes ',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade300.withOpacity(0.4),
                  child: const Icon(Icons.calculate),
                ),
                title: Row(
                  children: const [
                    Flexible(
                      child: Text(
                        'Medical Calculator:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Get access to 800+ Evidence based Calculator',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //  physics: BouncingScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     if (index < exploreArticleList.length) {
          //       return
          //     } else {
          //       Timer(const Duration(milliseconds: 30), () {
          //         trendingBulletinScrollController.jumpTo(
          //           trendingBulletinScrollController.position.maxScrollExtent,
          //         );
          //       });
          //       return _loadingIndicator();
          //     }
          //   },
          //   itemCount: exploreArticleList!.length,
          // ),
        ],
      ),
    );
  }

  Widget _newsArticle(BuildContext context, List<NewsEntity>? newsList) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade200.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'News',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize:kIsWeb?20: 30),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < newsList.length) {
                return kIsWeb? Row(children: [
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            newsList[index].title,
                            style: const TextStyle(
                             fontSize: 18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Image.network(newsList[index].urlToImage))
                ],):Column(
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            newsList[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Image.network(newsList[index].urlToImage)
                  ],
                );
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  trendingBulletinScrollController.jumpTo(
                    trendingBulletinScrollController.position.maxScrollExtent,
                  );
                });
                return _loadingIndicator();
              }
            },
            itemCount: newsList!.length,
          )
        ],
      ),
    );
  }
}
