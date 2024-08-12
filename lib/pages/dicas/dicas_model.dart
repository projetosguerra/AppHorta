import '/flutter_flow/flutter_flow_util.dart';
import 'dicas_widget.dart' show DicasWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DicasModel extends FlutterFlowModel<DicasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
