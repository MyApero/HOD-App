import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/nice/nice_clipper.dart';

import 'package:sensors_plus/sensors_plus.dart';

class NiceClipperGyroscope extends StatelessWidget {
  const NiceClipperGyroscope({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: gyroscopeEventStream(
            samplingPeriod: const Duration(milliseconds: 10)),
        builder: (context, snapshots) {
          GyroscopeEvent? gyr = snapshots.data as GyroscopeEvent?;

          if (gyr == null) return const NiceClipper();
          double value = 15 + (gyr.x + gyr.y + gyr.z) * 2;
          if (value < 1) value = 1;
          return NiceClipper(value: value);
        });
  }
}
