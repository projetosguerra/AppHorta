import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'sobre_app_model.dart';
export 'sobre_app_model.dart';

class SobreAppWidget extends StatefulWidget {
  const SobreAppWidget({super.key});

  @override
  State<SobreAppWidget> createState() => _SobreAppWidgetState();
}

class _SobreAppWidgetState extends State<SobreAppWidget> {
  late SobreAppModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SobreAppModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
