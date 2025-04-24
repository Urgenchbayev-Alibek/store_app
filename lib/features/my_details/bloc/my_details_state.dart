import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_details_state.freezed.dart';

enum MyDetailsStatus { idle, loading, submitted, error }

@freezed
abstract class MyDetailsState with _$MyDetailsState {
  const factory MyDetailsState({
    required MyDetailsStatus status,
  }) = _MyDetailsState;

  factory MyDetailsState.initial() => const MyDetailsState(status: MyDetailsStatus.idle);
}
