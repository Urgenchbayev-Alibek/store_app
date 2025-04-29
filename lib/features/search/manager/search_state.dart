import 'package:equatable/equatable.dart';
import '../../../data/models/category_model.dart';

enum SearchStatus { idle, loading, success, error }

class SearchState extends Equatable {
  final List<CategoryModel> categories;
  final SearchStatus status;

  const SearchState({
    required this.categories,
    required this.status,
  });

  factory SearchState.initial() {
    return SearchState(
      categories: [],
      status: SearchStatus.idle,
    );
  }

  SearchState copyWith({
    List<CategoryModel>? categories,
    SearchStatus? status,
  }) {
    return SearchState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [categories, status];
}