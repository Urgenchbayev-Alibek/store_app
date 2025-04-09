import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_card_event.dart';
part 'my_card_state.dart';

class MyCardBloc extends Bloc<MyCardEvent, MyCardState> {
  MyCardBloc() : super(MyCardInitial()) {
    on<MyCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
