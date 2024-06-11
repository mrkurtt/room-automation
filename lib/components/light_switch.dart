import 'package:flutter/material.dart';

class LightSwitch extends StatefulWidget {
  final String label;
  final bool initialValue;
  final void Function(bool) onChanged;

  const LightSwitch({
    required this.label,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  _LightSwitchState createState() => _LightSwitchState();
}

class _LightSwitchState extends State<LightSwitch> {
  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: TextStyle(fontSize: 18.0),
            ),
            Switch(
              value: _isOn,
              onChanged: (value) => setState(() {
                _isOn = value;
                widget.onChanged(value);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
