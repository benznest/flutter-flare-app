import 'dart:math';
import 'dart:ui';

import 'package:flare_flutter/flare.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/animation.dart';

class MyHouseController extends FlareController {

  FlutterActorArtboard _artboard;
  FlareAnimationLayer _demoAnimation;
  FlareAnimationLayer _sunAnimation;

  MyHouseController();


  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _sunAnimation.time =
        (_sunAnimation.time + elapsed) % _sunAnimation.duration;
    _sunAnimation.apply(artboard);

    _demoAnimation.time =
        (_demoAnimation.time + elapsed) % _demoAnimation.duration;
    _demoAnimation.apply(artboard);
    return true;
  }


  @override
  void initialize(FlutterActorArtboard artboard) {
    _artboard = artboard;
    _demoAnimation = FlareAnimationLayer()
      ..animation = _artboard.getAnimation("Demo Mode")
      ..mix = 1.0;
    _sunAnimation = FlareAnimationLayer()
      ..animation = _artboard.getAnimation("Sun Rotate")
      ..mix = 1.0;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

}
