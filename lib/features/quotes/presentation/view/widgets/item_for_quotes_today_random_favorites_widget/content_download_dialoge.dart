import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../view_model/managers/cubit/quotes_cubit.dart';
import '../../../view_model/managers/cubit/quotes_state.dart';

Widget contentDownloadDialog(context, quotes, image) =>
    BlocConsumer<QuotesCubit, QuotesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height * 0.1,
              top: MediaQuery.sizeOf(context).height * 0.5,
              right: MediaQuery.sizeOf(context).height * 0.1,
              left: MediaQuery.sizeOf(context).height * 0.1,
            ),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 5,
                        style: BorderStyle.solid,
                        color: ColorManager.white),
                    color: Colors.grey[200],
                    backgroundBlendMode: BlendMode.softLight,
                    borderRadius: BorderRadius.circular(30)),
                child: state is QuotesGetDownloadImageCubitMethodLoading ||
                        state is QuotesGetDownloadImageCubitMethodLoading
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(
                          color: ColorManager.white,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Download",
                            style: StyleHelper.textStyle18Medium(context,
                                color: ColorManager.white),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: TextButton(
                              onPressed: () {
                                QuotesCubit.get(context)
                                    .downloadImageCubitMethod(image, context);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Image Only",
                                      style: StyleHelper.textStyle18Medium(
                                          context,
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
                            child: TextButton(
                              onPressed: () {
                                QuotesCubit.get(context)
                                    .downloadImageWithTextCubitMethod(
                                        image, quotes.quote, context);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.purpleAccent.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "Text With Image",
                                      style: StyleHelper.textStyle18Bold(
                                          context,
                                          color: ColorManager.white),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      )),
          );
        });
