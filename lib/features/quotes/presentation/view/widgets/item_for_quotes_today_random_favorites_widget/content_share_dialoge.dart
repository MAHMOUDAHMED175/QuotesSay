import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../view_model/managers/cubit/quotes_cubit.dart';

Widget contentShareDialog(context, quotes, image) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * 0.1,
        top: MediaQuery.sizeOf(context).height * 0.45,
        right: MediaQuery.sizeOf(context).height * 0.1,
        left: MediaQuery.sizeOf(context).height * 0.1,
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 5, style: BorderStyle.solid, color: ColorManager.white),
            color: Colors.grey[200],
            backgroundBlendMode: BlendMode.softLight,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Share",
              style: StyleHelper.textStyle18Medium(context,
                  color: ColorManager.white),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: MaterialButton(
                onPressed: () {
                  Share.share(quotes.quote);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "text only",
                        style: StyleHelper.textStyle18Medium(context,
                            color: Colors.purpleAccent),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.001,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: MaterialButton(
                onPressed: () {
                  QuotesCubit.get(context).shareImage(image, context);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Image only",
                        style: StyleHelper.textStyle18Medium(context,
                            color: Colors.purpleAccent),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.001,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: MaterialButton(
                onPressed: () {
                  QuotesCubit.get(context)
                      .shareImageWithText(image, quotes.quote, context);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "text with image",
                        style: StyleHelper.textStyle18Bold(context,
                            color: ColorManager.white),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
