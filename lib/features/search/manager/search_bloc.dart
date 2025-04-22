import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/features/search/manager/search_state.dart';

import '../../../data/repositories/search_repository.dart';

part 'search_events.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState>{
  SearchBloc({required SearchRepository repo}): _repo = repo,super(SearchState.initial()){
    on<SearchRequest>(_onLoad);
  }

  final SearchRepository _repo;

  Future<void> _onLoad(SearchRequest event, Emitter<SearchState> emit)async{
    emit(state.copyWith(categories: [], status: SearchStatus.loading));
    final categories = await _repo.getSearchResult(event.title);
    emit(state.copyWith(categories: categories, status: SearchStatus.success));
  }
}