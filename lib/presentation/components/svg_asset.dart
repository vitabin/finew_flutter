import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../icons/icons.dart';

class SvgAsset extends StatelessWidget {
  final AssetName? assetName;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  const SvgAsset({
    super.key,
    this.assetName,
    this.height,
    this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        MeditationSvgAssets().assets[assetName] ?? "assets/icons/tape.svg",
        fit: fit ?? BoxFit.cover,
        color: color,
      ),
    );
  }
}
