import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  final double size;
  final bool overlay;

  const CustomLoader({
    Key? key,
    this.size = 120.0,
    this.overlay = true,
  }) : super(key: key);

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl; 
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget loader = AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: child,
        );
      },
      child: Image.asset(
        'assets/images/logo.png',
        width: widget.size,
        height: widget.size,
        fit: BoxFit.contain,
      ),
    );

    if (widget.overlay) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: ModalBarrier(
                color: Colors.white.withOpacity(0.8),
                dismissible: false,
              ),
            ),
            Center(child: loader),
          ],
        ),
      );
    }

    return Center(child: loader);
  }
}
