part of 'get_news_bloc.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsSuccess extends GetNewsState {
  final List<Articles> articles;

  GetNewsSuccess(this.articles);
}

final class GetNewsFailure extends GetNewsState {
  final String message;

  GetNewsFailure(this.message);
}

// final class DateState extends GetNewsState {
//   final DateTime dateTime;
//   DateState(this.dateTime);
// }
