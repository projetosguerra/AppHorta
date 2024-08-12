import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'inicio_widget.dart' show InicioWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InicioModel extends FlutterFlowModel<InicioWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, MinhasplantasRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions3) {
      s?.cancel();
    }
    listViewPagingController3?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, MinhasplantasRecord>
      setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, MinhasplantasRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, MinhasplantasRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryMinhasplantasRecordPage(
          parent: parent,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
