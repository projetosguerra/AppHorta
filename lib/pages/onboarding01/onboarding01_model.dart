import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding01_widget.dart' show Onboarding01Widget;
import 'package:flutter/material.dart';

class Onboarding01Model extends FlutterFlowModel<Onboarding01Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
