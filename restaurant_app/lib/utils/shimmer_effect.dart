import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/theme/theme.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerEffect extends StatelessWidget {
  final double? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerEffect(
      {Key? key, this.borderRadius, this.baseColor = shimmer, this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? shimmer,
      highlightColor: highlightColor??Colors.white,
      direction: ShimmerDirection.ltr,
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(borderRadius == null ? 4 : borderRadius!),
        child: Container(
          decoration: BoxDecoration(color: Color(0xffE5E5E6)),
        ),
      ),
    );
  }
}
