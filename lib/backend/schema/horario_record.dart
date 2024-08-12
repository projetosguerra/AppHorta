import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorarioRecord extends FirestoreRecord {
  HorarioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "saudacao" field.
  String? _saudacao;
  String get saudacao => _saudacao ?? '';
  bool hasSaudacao() => _saudacao != null;

  // "imgDate" field.
  String? _imgDate;
  String get imgDate => _imgDate ?? '';
  bool hasImgDate() => _imgDate != null;

  void _initializeFields() {
    _saudacao = snapshotData['saudacao'] as String?;
    _imgDate = snapshotData['imgDate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('horario');

  static Stream<HorarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HorarioRecord.fromSnapshot(s));

  static Future<HorarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HorarioRecord.fromSnapshot(s));

  static HorarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HorarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HorarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HorarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HorarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HorarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHorarioRecordData({
  String? saudacao,
  String? imgDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'saudacao': saudacao,
      'imgDate': imgDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class HorarioRecordDocumentEquality implements Equality<HorarioRecord> {
  const HorarioRecordDocumentEquality();

  @override
  bool equals(HorarioRecord? e1, HorarioRecord? e2) {
    return e1?.saudacao == e2?.saudacao && e1?.imgDate == e2?.imgDate;
  }

  @override
  int hash(HorarioRecord? e) =>
      const ListEquality().hash([e?.saudacao, e?.imgDate]);

  @override
  bool isValidKey(Object? o) => o is HorarioRecord;
}
