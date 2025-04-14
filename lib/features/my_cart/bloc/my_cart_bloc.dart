import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_cart_event.dart';
part 'my_cart_state.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  MyCartBloc() : super(MyCartInitial()) {
    on<MyCartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
