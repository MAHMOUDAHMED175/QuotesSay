import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:windowappflutter/core/utils/color_manager.dart';
import 'package:windowappflutter/core/utils/styles_manager.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_cubit.dart';

import '../../../../../core/shared/widgets/show_toast.dart';
import '../../../data/data_soutces/home_local_data_source.dart';
import '../../view_model/managers/cubit/quotes_state.dart';
import '../widgets/item_for_quotes_today_random_favorites_widget/item_for_quotes_today_random.dart';

class DayQuote extends StatefulWidget {
  DayQuote({Key? key}) : super(key: key);

  @override
  State<DayQuote> createState() => _DayQuoteState();
}

class _DayQuoteState extends State<DayQuote> {
  @override
  void initState() {
    _refresh(context);
    super.initState();
  }

  Future<void> _refresh(BuildContext context) async {
    // Added the void return type
    QuotesCubit.get(context).getImageForQuote();
    QuotesCubit.get(context).getTodayQuote();
  }

//https://m.dreamscity.net/imgcache/2/9990dreamscity.jpg
  @override
  Widget build(BuildContext context) {
    _refresh(context);
    return BlocConsumer<QuotesCubit, QuotesState>(listener: (context, state) {
      if (state is QuotesTodaySuccess) {
        QuotesCubit.get(context).todayQuotes.addAll(state.quote);
      }
      if (state is QuotesImageSuccess) {
        QuotesCubit.get(context).imageQuote = state.imageQuote;
      }
      if (state is QuotesTodayFailure) {
        QuotesCubit.get(context).todayQuotes =
            HomeLocalDataSourceImpl().getQuotesToday();
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
            condition: QuotesCubit.get(context).todayQuotes.isNotEmpty &&
                QuotesCubit.get(context).imageQuote.image.isNotEmpty,
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
                quotes: QuotesCubit.get(context).todayQuotes[0],
              ),
            ),
            fallback: (context) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.inkDrop(
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
