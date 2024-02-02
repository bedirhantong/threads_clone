import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class ParalaxConfig {
  final int? level;
  final AssetImage? image;

  const ParalaxConfig({
    this.level,
    this.image,
  });
}

class ThreadsLogoIndicator extends StatefulWidget {
  final Widget child;

  const ThreadsLogoIndicator({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _ThreadsLogoIndicatorState createState() => _ThreadsLogoIndicatorState();
}

class _ThreadsLogoIndicatorState extends State<ThreadsLogoIndicator>
    with SingleTickerProviderStateMixin {
  static const _assets = <ParalaxConfig>[
    ParalaxConfig(
      image: AssetImage("assets/images/refresh_indicator/refresh_threads.gif"),
      level: 1,
    ),
  ];

  static const _indicatorSize = 130.0;
  static const _imageSize = 400.0;

  late AnimationController _spoonController;
  static final _spoonTween = CurveTween(curve: Curves.easeInOut);

  @override
  void initState() {
    _spoonController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  Widget _buildImage(IndicatorController controller, ParalaxConfig asset) {
    return Transform.translate(
      offset: Offset(
        0,
        -(asset.level! * (controller.value.clamp(1.0, 1.5) - 1.0) * 20) + 10,
      ),
      child: OverflowBox(
        maxHeight: _imageSize,
        minHeight: _imageSize,
        maxWidth: _imageSize,
        minWidth: _imageSize,
        child: Image(
          image: asset.image!,
          fit: BoxFit.contain,
          height: _imageSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: _indicatorSize,
      onRefresh: () => Future.delayed(
        const Duration(seconds: 2),
      ),
      autoRebuild: false,
      child: widget.child,
      onStateChanged: (change) {
        if (change.didChange(to: IndicatorState.loading)) {
          _spoonController.repeat(reverse: true);
        } else if (change.didChange(from: IndicatorState.loading)) {
          _spoonController.stop();
        } else if (change.didChange(to: IndicatorState.idle)) {
          _spoonController.value = 4.0;
        }
      },
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        return Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? _) {
                return SizedBox(
                  height: controller.value * _indicatorSize,
                  child: Stack(
                    children: <Widget>[
                      for (int i = 0; i < _assets.length; i++)
                        if (i == 1)
                          AnimatedBuilder(
                            animation: _spoonController,
                            child: _buildImage(controller, _assets[i]),
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: (-_spoonTween
                                        .transform(_spoonController.value)) *
                                    1.25,
                                child: child,
                              );
                            },
                          )
                        else
                          _buildImage(controller, _assets[i])
                    ],
                  ),
                );
              },
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, controller.value * _indicatorSize),
                  child: child,
                );
              },
              animation: controller,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _spoonController.dispose();
    super.dispose();
  }
}
