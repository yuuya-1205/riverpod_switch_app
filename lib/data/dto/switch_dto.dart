import 'package:equatable/equatable.dart';

class SwitchDto extends Equatable {
  const SwitchDto({required this.isEnabled});

  final bool isEnabled;

  SwitchDto copyWith({bool? isEnabled}) {
    return SwitchDto(isEnabled: isEnabled ?? this.isEnabled);
  }

  @override
  List<Object?> get props => [isEnabled];
}
