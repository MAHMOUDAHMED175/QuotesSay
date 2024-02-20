import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:windowappflutter/features/quotes/presentation/view/widgets/item_for_quotes_today_random_favorites_widget/shimmer.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../../../core/utils/values_manager.dart';
import '../../../../domain/entities/quotes_with_images_hive_entity.dart';
import '../../../view_model/managers/cubit/quotes_cubit.dart';
import '../../../view_model/managers/cubit/quotes_state.dart';
import 'content_download_dialoge.dart';
import 'content_share_dialoge.dart';

Widget quotesItem(
  BuildContext context,
  state, {
  required quotes,
  required String image,
}) {
  return CachedNetworkImage(
    imageUrl: image,
    fadeInCurve: Curves.linear,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                    backgroundColor: ColorManager.glasx,
                    child: IconButton(
                        onPressed: () {
                          QuotesCubit.get(context).getImageForQuote();
                        },
                        icon: Icon(
                          Icons.image,
                          color: ColorManager.white,
                          size: AppSize.s20,
                        ))),
              ],
            ),
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
              quotes.quote,
              style: GoogleFonts.libreBaskerville(
                textStyle: StyleHelper.textStyle26Bold(context,
                    color: ColorManager.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  quotes.author,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    backgroundColor: ColorManager.glasx,
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return contentDownloadDialog(
                                    context, quotes, image);
                              });
                        },
                        icon: Icon(
                          Icons.file_download_outlined,
                          color: ColorManager.white,
                          size: AppSize.s20,
                        ))),
                CircleAvatar(
                    backgroundColor: ColorManager.glasx,
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return contentShareDialog(
                                    context, quotes, image);
                              });
                        },
                        icon: Icon(
                          Icons.share,
                          color: ColorManager.white,
                          size: AppSize.s20,
                        ))),
                CircleAvatar(
                    backgroundColor: ColorManager.glasx,
                    child: IconButton(
                        onPressed: () async {
                          Future<Uint8List> loadImage() async {
                            final http.Response response =
                                await http.get(Uri.parse(image));
                            return response.bodyBytes;
                          }

                          final Uint8List bytes = await loadImage();
                          QuotesWithImagesHiveEntity
                              quotesWithImagesHiveEntity =
                              QuotesWithImagesHiveEntity(
                                  quote: quotes.quote,
                                  author: quotes.author,
                                  image: bytes);
                          QuotesCubit.get(context)
                              .addQuoteWithImage(quotesWithImagesHiveEntity);
                        },
                        icon: Icon(
                          state is QuotesAddQuotesWithImagesSuccess
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: state is QuotesAddQuotesWithImagesSuccess
                              ? ColorManager.red
                              : ColorManager.white,
                          size: AppSize.s20,
                        ))),
              ],
            ),
          ],
        ),
      ),
    ),
    placeholder: (context, url) => shimmer(),
    errorWidget: (context, url, error) => const Icon(Icons.error_outline),
  );
}
