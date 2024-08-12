import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarioRecord extends FirestoreRecord {
  CalendarioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "dateString" field.
  String? _dateString;
  String get dateString => _dateString ?? '';
  bool hasDateString() => _dateString != null;

  // "data" field.
  int? _data;
  int get data => _data ?? 0;
  bool hasData() => _data != null;

  // "tempo" field.
  int? _tempo;
  int get tempo => _tempo ?? 0;
  bool hasTempo() => _tempo != null;

  // "timeString" field.
  String? _timeString;
  String get timeString => _timeString ?? '';
  bool hasTimeString() => _timeString != null;

  // "nota" field.
  int? _nota;
  int get nota => _nota ?? 0;
  bool hasNota() => _nota != null;

  // "nomeAgendamento" field.
  String? _nomeAgendamento;
  String get nomeAgendamento => _nomeAgendamento ?? '';
  bool hasNomeAgendamento() => _nomeAgendamento != null;

  // "descAgendamento" field.
  String? _descAgendamento;
  String get descAgendamento => _descAgendamento ?? '';
  bool hasDescAgendamento() => _descAgendamento != null;

  // "prioridade" field.
  DocumentReference? _prioridade;
  DocumentReference? get prioridade => _prioridade;
  bool hasPrioridade() => _prioridade != null;

  // "agendamento" field.
  String? _agendamento;
  String get agendamento => _agendamento ?? '';
  bool hasAgendamento() => _agendamento != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateString = snapshotData['dateString'] as String?;
    _data = castToType<int>(snapshotData['data']);
    _tempo = castToType<int>(snapshotData['tempo']);
    _timeString = snapshotData['timeString'] as String?;
    _nota = castToType<int>(snapshotData['nota']);
    _nomeAgendamento = snapshotData['nomeAgendamento'] as String?;
    _descAgendamento = snapshotData['descAgendamento'] as String?;
    _prioridade = snapshotData['prioridade'] as DocumentReference?;
    _agendamento = snapshotData['agendamento'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('calendario')
          : FirebaseFirestore.instance.collectionGroup('calendario');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('calendario').doc(id);

  static Stream<CalendarioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CalendarioRecord.fromSnapshot(s));

  static Future<CalendarioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CalendarioRecord.fromSnapshot(s));

  static CalendarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CalendarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CalendarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CalendarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CalendarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CalendarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCalendarioRecordData({
  String? dateString,
  int? data,
  int? tempo,
  String? timeString,
  int? nota,
  String? nomeAgendamento,
  String? descAgendamento,
  DocumentReference? prioridade,
  String? agendamento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dateString': dateString,
      'data': data,
      'tempo': tempo,
      'timeString': timeString,
      'nota': nota,
      'nomeAgendamento': nomeAgendamento,
      'descAgendamento': descAgendamento,
      'prioridade': prioridade,
      'agendamento': agendamento,
    }.withoutNulls,
  );

  return firestoreData;
}

class CalendarioRecordDocumentEquality implements Equality<CalendarioRecord> {
  const CalendarioRecordDocumentEquality();

  @override
  bool equals(CalendarioRecord? e1, CalendarioRecord? e2) {
    return e1?.dateString == e2?.dateString &&
        e1?.data == e2?.data &&
        e1?.tempo == e2?.tempo &&
        e1?.timeString == e2?.timeString &&
        e1?.nota == e2?.nota &&
        e1?.nomeAgendamento == e2?.nomeAgendamento &&
        e1?.descAgendamento == e2?.descAgendamento &&
        e1?.prioridade == e2?.prioridade &&
        e1?.agendamento == e2?.agendamento;
  }

  @override
  int hash(CalendarioRecord? e) => const ListEquality().hash([
        e?.dateString,
        e?.data,
        e?.tempo,
        e?.timeString,
        e?.nota,
        e?.nomeAgendamento,
        e?.descAgendamento,
        e?.prioridade,
        e?.agendamento
      ]);

  @override
  bool isValidKey(Object? o) => o is CalendarioRecord;
}
