import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:switch_app/data/dto/switch_dto.dart';
import 'package:switch_app/data/repository/firebase_firestore_repository.dart';

final switchRepositoryProvider = Provider<SwitchRepository>((ref) {
  return SwitchRepository(ref);
});

class SwitchRepository {
  SwitchRepository(this.ref);

  final Ref ref;

  /// 特定のドキュメントIDを取得して、そのドキュメントのisEnabledを取得する。
  Stream<SwitchDto> subscribeSwitchIsEnabled({required String documentId}) {
    return ref
        .read(firebaseFirestoreProvider)
        .collection('switch')
        .doc(documentId)
        .snapshots()
        .map(
          (snapshot) =>
              SwitchDto(isEnabled: snapshot.data()?['isEnabled'] as bool),
        );
  }

  Future<void> switchOn({required String documentId}) async {
    await Future.delayed(Duration(seconds: 3));
    await ref
        .read(firebaseFirestoreProvider)
        .collection('switch')
        .doc(documentId)
        .set({'isEnabled': true});
  }

  Future<void> switchOff({required String documentId}) async {
    await ref
        .read(firebaseFirestoreProvider)
        .collection('switch')
        .doc(documentId)
        .set({'isEnabled': false});
  }
}
