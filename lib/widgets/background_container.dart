import 'package:flutter/material.dart';

class BackgroundContainer extends StatefulWidget {
  final Widget childWidget;
  const BackgroundContainer({required this.childWidget, super.key});

  @override
  State<BackgroundContainer> createState() => _BackgroundContainerState();
}

class _BackgroundContainerState extends State<BackgroundContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _bottomAlignmentAnimation;
  late Animation<Alignment> _topAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
        weight: 2,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomLeft,
          end: Alignment.topLeft,
        ),
        weight: 2,
      ),
    ]).animate(_animationController);

    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        weight: 3,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
        ),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        weight: 3,
      ),
    ]).animate(_animationController);

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: const [
                Color(0xFF272A4D),
                Color(0xFF0F1334),
              ],
              center: _bottomAlignmentAnimation.value,
              radius: 1,
            ),
          ),
          child: widget.childWidget,
        );
      },
    );
  }
}
