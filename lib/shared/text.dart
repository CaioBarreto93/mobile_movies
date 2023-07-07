import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  final String _text;
  final Color? _color;
  final double? _size;

  const modified_text({required String text,Color? color,double? size, super.key}): _text = text, _color = color, _size = size;
  @override
  Widget build(BuildContext context) {
    return Text(_text, style: GoogleFonts.roboto(color: _color, fontSize: _size));
  }
}