part of 'get_news_bloc.dart';

@immutable
sealed class GetNewsEvent {}

class DoGetNewsEvent extends GetNewsEvent {}