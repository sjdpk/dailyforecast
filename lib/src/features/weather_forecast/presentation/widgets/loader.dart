import 'package:dailyforecast/src/config/constants/images.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final double? size;
  const LoaderWidget({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        ImageCollection.loadingIcon,
        height: size,
        width: size,
      ),
    );
  }
}
