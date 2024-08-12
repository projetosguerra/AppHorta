import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MinhasplantasRecord extends FirestoreRecord {
  MinhasplantasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "descricaoplanta" field.
  String? _descricaoplanta;
  String get descricaoplanta => _descricaoplanta ?? '';
  bool hasDescricaoplanta() => _descricaoplanta != null;

  // "fotoplanta" field.
  String? _fotoplanta;
  String get fotoplanta => _fotoplanta ?? '';
  bool hasFotoplanta() => _fotoplanta != null;

  // "nomeplanta" field.
  String? _nomeplanta;
  String get nomeplanta => _nomeplanta ?? '';
  bool hasNomeplanta() => _nomeplanta != null;

  // "queroplantar" field.
  bool? _queroplantar;
  bool get queroplantar => _queroplantar ?? false;
  bool hasQueroplantar() => _queroplantar != null;

  // "favorito" field.
  bool? _favorito;
  bool get favorito => _favorito ?? false;
  bool hasFavorito() => _favorito != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _descricaoplanta = snapshotData['descricaoplanta'] as String?;
    _fotoplanta = snapshotData['fotoplanta'] as String?;
    _nomeplanta = snapshotData['nomeplanta'] as String?;
    _queroplantar = snapshotData['queroplantar'] as bool?;
    _favorito = snapshotData['favorito'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('minhasplantas')
          : FirebaseFirestore.instance.collectionGroup('minhasplantas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('minhasplantas').doc(id);

  static Stream<MinhasplantasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MinhasplantasRecord.fromSnapshot(s));

  static Future<MinhasplantasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MinhasplantasRecord.fromSnapshot(s));

  static MinhasplantasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MinhasplantasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MinhasplantasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MinhasplantasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MinhasplantasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MinhasplantasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMinhasplantasRecordData({
  String? descricaoplanta,
  String? fotoplanta,
  String? nomeplanta,
  bool? queroplantar,
  bool? favorito,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descricaoplanta': descricaoplanta,
      'fotoplanta': fotoplanta,
      'nomeplanta': nomeplanta,
      'queroplantar': queroplantar,
      'favorito': favorito,
    }.withoutNulls,
  );

  return firestoreData;
}

class MinhasplantasRecordDocumentEquality
    implements Equality<MinhasplantasRecord> {
  const MinhasplantasRecordDocumentEquality();

  @override
  bool equals(MinhasplantasRecord? e1, MinhasplantasRecord? e2) {
    return e1?.descricaoplanta == e2?.descricaoplanta &&
        e1?.fotoplanta == e2?.fotoplanta &&
        e1?.nomeplanta == e2?.nomeplanta &&
        e1?.queroplantar == e2?.queroplantar &&
        e1?.favorito == e2?.favorito;
  }

  @override
  int hash(MinhasplantasRecord? e) => const ListEquality().hash([
        e?.descricaoplanta,
        e?.fotoplanta,
        e?.nomeplanta,
        e?.queroplantar,
        e?.favorito
      ]);

  @override
  bool isValidKey(Object? o) => o is MinhasplantasRecord;
}
