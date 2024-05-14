import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/constants/colors.dart';
import 'package:news_app/presentation/bloc/get_news/get_news_bloc.dart';
import 'package:news_app/presentation/pages/detail_news_page.dart';
import 'package:news_app/presentation/widget/appbar_default.dart';
import 'package:news_app/presentation/widget/button_action.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<GetNewsBloc>().add(DoGetNewsEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
        children: [
          AppBarDefault(
            title: 'NEWS APP',
            // useShadow: false,
            withLeading: false,
            actions: [
              ButtonAction(
                onTap: () {},
                child: const Icon(Icons.notifications_none_rounded),
              ),
              const SizedBox(width: 4),
              ButtonAction(
                onTap: () {},
                child: const Icon(Icons.search_rounded),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<GetNewsBloc, GetNewsState>(
              builder: (context, state) {
                if (state is GetNewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetNewsFailure) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                if (state is GetNewsInitial) {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
                final articles = (state as GetNewsSuccess).articles;
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<GetNewsBloc>().add(DoGetNewsEvent());
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 8),
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailNewsPage(
                                    articles: articles[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width / 4.5,
                                  width:
                                      MediaQuery.of(context).size.width / 4.5,
                                  decoration: BoxDecoration(
                                    color: kColorPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: articles[index].urlToImage != null
                                      ? Image.network(
                                          articles[index].urlToImage!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(Icons.image_rounded),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 14,
                                            backgroundColor: kColorPrimary,
                                            child: Icon(
                                              Icons.person_outline_rounded,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              articles[index].author ??
                                                  'Author',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        articles[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('E, dd MMM yyyy').format(
                                          DateTime.parse(
                                              articles[index].publishedAt),
                                        ),
                                        style: const TextStyle(
                                          color: kColorGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
