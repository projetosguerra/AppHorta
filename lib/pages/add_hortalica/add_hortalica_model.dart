import '/flutter_flow/flutter_flow_util.dart';
import 'add_hortalica_widget.dart' show AddHortalicaWidget;
import 'package:flutter/material.dart';

class AddHortalicaModel extends FlutterFlowModel<AddHortalicaWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode1;
  TextEditingController? projectNameTextController1;
  String? Function(BuildContext, String?)? projectNameTextController1Validator;
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode2;
  TextEditingController? projectNameTextController2;
  String? Function(BuildContext, String?)? projectNameTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    projectNameFocusNode1?.dispose();
    projectNameTextController1?.dispose();

    projectNameFocusNode2?.dispose();
    projectNameTextController2?.dispose();
  }
}
