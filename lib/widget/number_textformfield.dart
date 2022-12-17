import 'package:flutter/material.dart';

class NumberTextFormField extends StatelessWidget {
  const NumberTextFormField({
    Key? key,
    required TextEditingController controller,
    required String txtLabel,
  })  : _controller = controller,
        _txtLabel = txtLabel,
        super(key: key);

  final TextEditingController _controller;
  final String _txtLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Text(_txtLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$_txtLabel alanı boş bırakılamaz";
        }
        return null;
      },
    );
  }
}
