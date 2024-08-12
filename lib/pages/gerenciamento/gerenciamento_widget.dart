import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'gerenciamento_model.dart';
export 'gerenciamento_model.dart';

class GerenciamentoWidget extends StatefulWidget {
  const GerenciamentoWidget({super.key});

  @override
  State<GerenciamentoWidget> createState() => _GerenciamentoWidgetState();
}

class _GerenciamentoWidgetState extends State<GerenciamentoWidget> {
  late GerenciamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GerenciamentoModel());
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
