import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  const SwitchState({required this.isEnabled});

  final bool isEnabled;

  SwitchState copyWith({bool? isEnabled}) {
    return SwitchState(isEnabled: isEnabled ?? this.isEnabled);
  }

  @override
  List<Object?> get props => [isEnabled];
}
