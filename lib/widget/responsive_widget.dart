import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {super.key, required Widget mobile, required Widget web})
      : _mobile = mobile,
        _web = web;
  final Widget _mobile;
  final Widget _web;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 520) {
          return _mobile;
        } else {
          return _web;
        }
      },
    );
  }
}
