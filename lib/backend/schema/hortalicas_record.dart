import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HortalicasRecord extends FirestoreRecord {
  HortalicasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "favorito" field.
  bool? _favorito;
  bool get favorito => _favorito ?? false;
  bool hasFavorito() => _favorito != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "clima" field.
  String? _clima;
  String get clima => _clima ?? '';
  bool hasClima() => _clima != null;

  // "espaco" field.
  String? _espaco;
  String get espaco => _espaco ?? '';
  bool hasEspaco() => _espaco != null;

  // "colheita" field.
  String? _colheita;
  String get colheita => _colheita ?? '';
  bool hasColheita() => _colheita != null;

  // "imgHortalica" field.
  String? _imgHortalica;
  String get imgHortalica => _imgHortalica ?? '';
  bool hasImgHortalica() => _imgHortalica != null;

  // "nomeCientifico" field.
  String? _nomeCientifico;
  String get nomeCientifico => _nomeCientifico ?? '';
  bool hasNomeCientifico() => _nomeCientifico != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _favorito = snapshotData['favorito'] as bool?;
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _clima = snapshotData['clima'] as String?;
    _espaco = snapshotData['espaco'] as String?;
    _colheita = snapshotData['colheita'] as String?;
    _imgHortalica = snapshotData['imgHortalica'] as String?;
    _nomeCientifico = snapshotData['nomeCientifico'] as String?;
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hortalicas');

  static Stream<HortalicasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HortalicasRecord.fromSnapshot(s));

  static Future<HortalicasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HortalicasRecord.fromSnapshot(s));

  static HortalicasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HortalicasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HortalicasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HortalicasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HortalicasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HortalicasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHortalicasRecordData({
  bool? favorito,
  String? nome,
  String? descricao,
  String? clima,
  String? espaco,
  String? colheita,
  String? imgHortalica,
  String? nomeCientifico,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'favorito': favorito,
      'nome': nome,
      'descricao': descricao,
      'clima': clima,
      'espaco': espaco,
      'colheita': colheita,
      'imgHortalica': imgHortalica,
      'nomeCientifico': nomeCientifico,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class HortalicasRecordDocumentEquality implements Equality<HortalicasRecord> {
  const HortalicasRecordDocumentEquality();

  @override
  bool equals(HortalicasRecord? e1, HortalicasRecord? e2) {
    return e1?.favorito == e2?.favorito &&
        e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        e1?.clima == e2?.clima &&
        e1?.espaco == e2?.espaco &&
        e1?.colheita == e2?.colheita &&
        e1?.imgHortalica == e2?.imgHortalica &&
        e1?.nomeCientifico == e2?.nomeCientifico &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(HortalicasRecord? e) => const ListEquality().hash([
        e?.favorito,
        e?.nome,
        e?.descricao,
        e?.clima,
        e?.espaco,
        e?.colheita,
        e?.imgHortalica,
        e?.nomeCientifico,
        e?.icon
      ]);

  @override
  bool isValidKey(Object? o) => o is HortalicasRecord;
}
