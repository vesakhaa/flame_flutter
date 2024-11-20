import 'dart:async';
import 'package:dasar_flame/component/asteroid.dart';
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import '../component/ship.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    // Asteroid a = Asteroid();
    // add(a);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000045); // Background color set to dark blue
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {s.setTujuan(info);}

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }
}
