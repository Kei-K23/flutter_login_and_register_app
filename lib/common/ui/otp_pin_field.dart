import 'package:flutter/material.dart';

class OtpPinField extends StatefulWidget {
  final int length;
  final void Function(String) onCompleted;
  final double spacing;
  final double fieldWidth;
  final TextStyle textStyle;
  final Color borderColor;
  final bool obscure;

  const OtpPinField({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.spacing = 12,
    this.fieldWidth = 48,
    this.textStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.borderColor = Colors.grey,
    this.obscure = false,
  });

  @override
  State<OtpPinField> createState() => _OtpPinFieldState();
}

class _OtpPinFieldState extends State<OtpPinField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _controllers = List.generate(widget.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final code = _controllers.map((c) => c.text).join();
    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Container(
          width: widget.fieldWidth,
          margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            obscureText: widget.obscure,
            maxLength: 1,
            style: widget.textStyle,
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
            onTap: () {
              _controllers[index].selection = TextSelection(
                baseOffset: 0,
                extentOffset: _controllers[index].text.length,
              );
            },
          ),
        );
      }),
    );
  }
}
