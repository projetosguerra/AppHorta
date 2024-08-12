import '/flutter_flow/flutter_flow_util.dart';
import 'materiais_cultivo_widget.dart' show MateriaisCultivoWidget;
import 'package:flutter/material.dart';

class MateriaisCultivoModel extends FlutterFlowModel<MateriaisCultivoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
