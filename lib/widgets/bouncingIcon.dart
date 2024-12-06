import 'package:flutter/widgets.dart';

class BouncingIcon extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;

  const BouncingIcon({super.key, this.onTap, required this.child});

  @override
  _BouncingIconState createState() => _BouncingIconState();
}

class _BouncingIconState extends State<BouncingIcon>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
        lowerBound: 0.0,
        upperBound: 0.3)
      ..addListener(() {
        setState(
          () {},
        );
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;

    return GestureDetector(
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onTap,
);
}
}