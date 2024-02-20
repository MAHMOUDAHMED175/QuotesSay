import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/image_assets_manager.dart';
import '../../../../../../core/utils/values_manager.dart';

Widget shimmer() => Shimmer.fromColors(
      baseColor: ColorManager.grey200,
      highlightColor: ColorManager.white,
      period: const Duration(seconds: 1),
      direction: ShimmerDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12),
            image: DecorationImage(
                image: const AssetImage(ImageAssets.background),
                colorFilter:
                    ColorFilter.mode(ColorManager.red, BlendMode.difference),
                fit: BoxFit.cover,
                opacity: 0.7)),
      ),
    );
