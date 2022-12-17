import 'package:flutter/material.dart';

class ClockPickerTextFormField extends StatelessWidget {
  const ClockPickerTextFormField({
    Key? key,
    required TextEditingController controller,
    required String txtLabel,
    required VoidCallback callback,
  })  : _controller = controller,
        _txtLabel = txtLabel,
        _callback = callback,
        super(key: key);

  final TextEditingController _controller;
  final String _txtLabel;
  final VoidCallback _callback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: Text(_txtLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$_txtLabel boş bırakılamaz";
        }
        return null;
      },
      onTap: _callback,
    );
  }
}
