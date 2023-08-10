import 'package:flutter/material.dart';

class WeatherInfoImageWidget extends StatelessWidget {
  final String? icon;
  final double? height;
  final BoxFit? fit;
  const WeatherInfoImageWidget({super.key, this.icon, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    if (icon == null) return const SizedBox.shrink();
    return Image.network(
      icon!,
      fit: fit ?? BoxFit.contain,
      height: height ?? 140,
    );
  }
}
