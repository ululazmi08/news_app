import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/constants/colors.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/presentation/widget/appbar_default.dart';
import 'package:news_app/presentation/widget/button_action.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({Key? key, required this.articles}) : super(key: key);

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
        children: [
          AppBarDefault(
            title: 'Happy Reading',
            useShadow: false,
            actions: [
              ButtonAction(
                onTap: () {},
                child: const Icon(Icons.more_horiz_outlined),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kColorPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: articles.urlToImage != null
                        ? Image.network(
                            articles.urlToImage!,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image_rounded),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Text(
                          articles.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
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
                            const SizedBox(width: 8),
                            Text(
                              articles.author ?? 'Author',
                            ),
                            Text(
                              ' • ${DateFormat('E, dd MMM yyyy').format(DateTime.parse(articles.publishedAt))}',
                              style: const TextStyle(color: kColorGrey),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          articles.description ?? 'This is description',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: kColorPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(articles.content ?? 'This is contetn'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
