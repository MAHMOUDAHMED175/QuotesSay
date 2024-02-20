import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../../../../domain/entities/quotes_with_images_hive_entity.dart';
import '../../../view_model/managers/cubit/quotes_cubit.dart';

Widget quotesItem(
  state,
  BuildContext context, {
  required QuotesWithImagesHiveEntity quotesWithImagesHiveEntity,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSize.s12),
      image: DecorationImage(
        image: MemoryImage(quotesWithImagesHiveEntity.image),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.format_quote_outlined,
                    color: ColorManager.white,
                    size: AppSize.s70,
                  )),
            ],
          ),
          Text(
            quotesWithImagesHiveEntity.quote,
            style: GoogleFonts.libreBaskerville(
              textStyle: StyleHelper.textStyle26Bold(context,
                  color: ColorManager.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                quotesWithImagesHiveEntity.author,
                maxLines: 2,
                style: GoogleFonts.cairo(
                  textStyle: StyleHelper.textStyle22Bold(
                    context,
                    color: ColorManager.white,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: ColorManager.glasx,
                  child: IconButton(
                      onPressed: () {
                        quotesWithImagesHiveEntity.delete();
                        QuotesCubit.get(context).fetchAllQuotesWithImages();
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: ColorManager.red,
                        size: AppSize.s20,
                      ))),
            ],
          ),
        ],
      ),
    ),
  );
}
