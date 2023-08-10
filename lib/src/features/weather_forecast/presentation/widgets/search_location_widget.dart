import 'package:dailyforecast/src/config/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchLocationWidget extends StatelessWidget {
  final double? height;
  const SearchLocationWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(color: secondaryColor.withOpacity(0.4)),
      child: Text("Search Locations"),
    );
  }
}
