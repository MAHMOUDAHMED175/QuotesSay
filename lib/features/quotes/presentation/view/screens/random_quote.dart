import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:windowappflutter/core/shared/widgets/show_toast.dart';
import 'package:windowappflutter/core/utils/color_manager.dart';
import 'package:windowappflutter/core/utils/styles_manager.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_cubit.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_state.dart';

import '../../../data/data_soutces/home_local_data_source.dart';
import '../widgets/item_for_quotes_today_random_favorites_widget/item_for_quotes_today_random.dart';

class RandomQuote extends StatefulWidget {
  RandomQuote({Key? key}) : super(key: key);

  @override
  State<RandomQuote> createState() => _RandomQuoteState();
}

class _RandomQuoteState extends State<RandomQuote> {
  @override
  void initState() {
    refresh(context);
    super.initState();
  }

  Future<void> refresh(BuildContext context) async {
    QuotesCubit.get(context).getRandomQuote();
    QuotesCubit.get(context).getImageForQuote();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuotesCubit, QuotesState>(listener: (context, state) {
      if (state is QuotesRandomSuccess) {
        QuotesCubit.get(context).randomQuotes.addAll(state.quote);
      }
      if (state is QuotesImageSuccess) {
        QuotesCubit.get(context).imageQuote = state.imageQuote;
      }
      if (state is QuotesRandomFailure) {
        QuotesCubit.get(context).randomQuotes =
            HomeLocalDataSourceImpl().getQuotesRandom();
      }
      if (state is QuotesGetDownloadImageCubitMethodSuccess ||
          state is QuotesGetDownloadImageWithTextCubitMethodSuccess) {
        Navigator.pop(context);
        showToast(
            context: context,
            text: "Downloaded Successfully",
            colorText: ColorManager.black,
            colorIcon: Colors.purpleAccent,
            toastState: ToastStates.SUCCECC);
      }

      if (state is QuotesImageFailure ||
          state is QuotesGetDownloadImageCubitMethodFailure ||
          state is QuotesGetDownloadImageWithTextCubitMethodFailure) {
        showToast(
            context: context,
            text: " يرجى المحاوله لاحقا",
            colorText: ColorManager.white,
            colorIcon: Colors.purpleAccent,
            toastState: ToastStates.ERROR);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ConditionalBuilder(
            condition: false,
            // QuotesCubit.get(context).randomQuotes.isNotEmpty &&
            //     QuotesCubit.get(context).imageQuote.image.isNotEmpty,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.01,
              ),
              child: quotesItem(
                context,
                state,
                image: QuotesCubit.get(context).imageQuote.image,
                quotes: QuotesCubit.get(context).randomQuotes[0],
              ),
            ),
            fallback: (context) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.hexagonDots(
                    color: Colors.purpleAccent,
                    size: 80,
                  ),
                  Text(
                    "\nLoading Quote...\n\nCheck Your Internet",
                    style: GoogleFonts.libreBaskerville(
                      textStyle: StyleHelper.textStyle26Bold(context,
                          color: Colors.purpleAccent),
                    ),
                  ),
                ],
              ));
            },
          ),
        ),
      );
    });
  }
}
