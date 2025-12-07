import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/model/switch_state.dart';

final switchNotifierProvider = NotifierProvider<SwitchNotifier, SwitchState>(
  () => SwitchNotifier(),
);

class SwitchNotifier extends Notifier<SwitchState> {
  @override
  SwitchState build() {
    return const SwitchState(isEnabled: false);
  }

  /// SwitchをOnにする。
  ///
  /// 3秒後にSwitchをOnにする。
  Future<void> switchOn() async {
    await Future.delayed(const Duration(seconds: 3));
    state = state.copyWith(isEnabled: true);
  }

  /// SwitchをOffにする。
  void switchOff() {
    state = state.copyWith(isEnabled: false);
  }
}
