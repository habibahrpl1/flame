

import 'dart:async';
import 'dart:ui';

import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';


class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late BgParallaxComponent bgParallax;

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }
  @override 
  FutureOr<void> onLoad() async {
    bgParallax = BgParallaxComponent();
    add(bgParallax);
    s = Ship();
    add(s);  
  }
  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info);
  } 
  
  @override
    void update(double dt) {
      bgParallax.changeSpeedBasedShip(s);
      super.update(dt);
    }
}