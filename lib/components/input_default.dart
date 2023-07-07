import 'package:flutter/material.dart';

import '../shared/constants.dart';

class InputDefault extends StatelessWidget {
  final String? _labelText;
  final String? _hintText;
  final TextEditingController? _controller;
  final String? Function(String?)? _validator;
  final TextInputType? _keyboardType;
  final bool _obscureText;
  final bool _autofocus;
  final void Function()? _onTap;
  final void Function(String)? _onChanged;

  const InputDefault({
    String? labelText,
    TextEditingController? controller,
    String? hintText,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool? obscureText,
    bool? autofocus,
    void Function()? onTap,
    void Function(String)? onChanged,
    super.key,
  })  : _labelText = labelText,
        _hintText = hintText,
        _controller = controller,
        _validator = validator,
        _keyboardType = keyboardType,
        _obscureText = obscureText ?? false,
        _onTap = onTap,
        _autofocus = autofocus ?? false,
        _onChanged = onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: _onTap,
      autofocus: _autofocus,
      obscureText: _obscureText,
      keyboardType: _keyboardType,
      validator: _validator,
      controller: _controller,
      onChanged: _onChanged,
      decoration: InputDecoration(
        focusedBorder: AppConstants.borderStyle,
        enabledBorder: AppConstants.borderStyle,
        border: AppConstants.borderStyle,
        filled: true,
        fillColor: Colors.white,
        labelText: _labelText,
        hintText: _hintText,
      ),
    );
  }
}
