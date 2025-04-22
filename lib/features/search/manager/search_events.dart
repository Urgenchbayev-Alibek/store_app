part of'search_bloc.dart';

sealed class SearchEvents{}

final class SearchRequest extends SearchEvents{
  final String title;
  SearchRequest({required this.title});
}