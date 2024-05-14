import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/datasources/news_datasource.dart';
import 'package:news_app/data/models/news_model.dart';

part 'get_news_event.dart';
part 'get_news_state.dart';

class GetNewsBloc extends Bloc<GetNewsEvent, GetNewsState> {
  final NewsDatasource newsDatasource;
  GetNewsBloc(this.newsDatasource) : super(GetNewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      // TODO: implement event handler
      emit(GetNewsLoading());
      try {
        final model = await newsDatasource.getNews();
        emit(GetNewsSuccess(model.articles));
      } catch (e) {
        emit(GetNewsFailure(e.toString()));
      }
    });
  }
}
