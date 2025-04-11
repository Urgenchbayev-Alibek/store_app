import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/products_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _repository;

  HomeBloc({required ProductRepository repo})
      : _repository = repo,
        super(HomeState.initial()) {
    on<HomeLoad>(_load);
    add(HomeLoad());
  }

  Future<void> _load(HomeLoad event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final product = await _repository.fetchProducts();
      emit(state.copyWith(products: product, status: HomeStatus.idle));
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.error),
      );
    }
  }
}
