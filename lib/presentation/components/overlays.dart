// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Overlay extends StatefulWidget {
  const Overlay({
    super.key,
    required this.event,
    required this.child,
    this.radius,
  });
  final Function event;
  final Widget child;
  final double? radius;

  @override
  _OverlayState createState() => _OverlayState();
}

class _OverlayState extends State<Overlay> {
  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(builder: (context) => SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        child: widget.child,
      ),
    );
  }
}
