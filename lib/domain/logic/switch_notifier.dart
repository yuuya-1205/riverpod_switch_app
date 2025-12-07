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
    state = const AsyncValue.loading();
    await ref.read(switchRepositoryProvider).switchOn(documentId: documentId);

    /// SwitchStateを更新する。
    state = AsyncValue.data(SwitchState(isEnabled: true));

    ref.invalidateSelf();
  }

  /// SwitchをOffにする。
  Future<void> switchOff() async {
    await ref.read(switchRepositoryProvider).switchOff(documentId: documentId);

    /// SwitchStateを更新する。
    state = AsyncValue.data(SwitchState(isEnabled: false));
    ref.invalidateSelf();
  }
}
