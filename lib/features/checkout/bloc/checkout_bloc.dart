// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'checkout_event.dart';
// import 'checkout_state.dart';
//
// class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
//   final CheckoutRepository repository;
//
//   CheckoutBloc(this.repository) : super(CheckoutInitial()) {
//     on<LoadCheckoutEvent>((event, emit) async {
//       emit(CheckoutLoading());
//       try {
//         final model = await repository.getCheckoutDetails();
//         emit(CheckoutLoaded(model));
//       } catch (e) {
//         emit(CheckoutFailure("Failed to load checkout details"));
//       }
//     });
//
//     on<PlaceOrderEvent>((event, emit) async {
//       emit(CheckoutPlacingOrder());
//       try {
//         await repository.submitOrder();
//         emit(CheckoutSuccess());
//       } catch (e) {
//         emit(CheckoutFailure("Failed to place order"));
//       }
//     });
//   }
// }
