import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiasRecord extends FirestoreRecord {
  DiasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "dateString" field.
  String? _dateString;
  String get dateString => _dateString ?? '';
  bool hasDateString() => _dateString != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _dateString = snapshotData['dateString'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dias');

  static Stream<DiasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiasRecord.fromSnapshot(s));

  static Future<DiasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiasRecord.fromSnapshot(s));

  static DiasRecord fromSnapshot(DocumentSnapshot snapshot) => DiasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiasRecordData({
  DateTime? date,
  int? status,
  String? dateString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'status': status,
      'dateString': dateString,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiasRecordDocumentEquality implements Equality<DiasRecord> {
  const DiasRecordDocumentEquality();

  @override
  bool equals(DiasRecord? e1, DiasRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.dateString == e2?.dateString;
  }

  @override
  int hash(DiasRecord? e) =>
      const ListEquality().hash([e?.date, e?.status, e?.dateString]);

  @override
  bool isValidKey(Object? o) => o is DiasRecord;
}
