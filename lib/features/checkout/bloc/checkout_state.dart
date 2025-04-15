// import 'package:equatable/equatable.dart';
//
//
// abstract class CheckoutState extends Equatable {
//   const CheckoutState();
//   @override
//   List<Object?> get props => [];
// }
//
// class CheckoutInitial extends CheckoutState {}
//
// class CheckoutLoading extends CheckoutState {}
//
// class CheckoutLoaded extends CheckoutState {
//   final CheckoutModel model;
//   const CheckoutLoaded(this.model);
//
//   @override
//   List<Object?> get props => [model];
// }
//
// class CheckoutPlacingOrder extends CheckoutState {}
//
// class CheckoutSuccess extends CheckoutState {}
//
// class CheckoutFailure extends CheckoutState {
//   final String message;
//   const CheckoutFailure(this.message);
//
//   @override
//   List<Object?> get props => [message];
// }
