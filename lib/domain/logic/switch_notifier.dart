import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/data/repository/switch_repository.dart';
import 'package:switch_app/domain/model/switch_state.dart';

final switchNotifierProvider =
    StreamNotifierProvider<SwitchNotifier, SwitchState>(() => SwitchNotifier());
const String documentId = 'x6qOk5aT9ojUgoBJrEWS';

class SwitchNotifier extends StreamNotifier<SwitchState> {
  @override
  Stream<SwitchState> build() {
    return ref
        .watch(switchRepositoryProvider)
        .subscribeSwitchIsEnabled(documentId: documentId)
        .map((switchDto) => SwitchState(isEnabled: switchDto.isEnabled));
  }

  /// SwitchをOnにする。
  ///
  /// 3秒後にSwitchをOnにする。
  Future<void> switchOn() async {
    await Future.delayed(const Duration(seconds: 3));
    state = AsyncValue.data(SwitchState(isEnabled: true));
  }

  /// SwitchをOffにする。
  void switchOff() {
    state = AsyncValue.data(SwitchState(isEnabled: false));
  }
}
