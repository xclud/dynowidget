import './objectbuilder.dart';
import 'package:flutter/material.dart';

class DynoWidget extends StatefulWidget {
  final Object json;
  final ObjectBuildContext builder;
  DynoWidget(this.json, this.builder);

  @override
  _DynoWidgetState createState() => _DynoWidgetState();
}

class _DynoWidgetState extends State<DynoWidget> {
  Widget _content;

  @override
  void initState() {
    _content = widget.builder.widget.build(widget.json);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _content;
  }
}
