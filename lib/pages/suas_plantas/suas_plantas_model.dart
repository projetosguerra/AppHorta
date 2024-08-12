import '/flutter_flow/flutter_flow_util.dart';
import 'suas_plantas_widget.dart' show SuasPlantasWidget;
import 'package:flutter/material.dart';

class SuasPlantasModel extends FlutterFlowModel<SuasPlantasWidget> {
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
