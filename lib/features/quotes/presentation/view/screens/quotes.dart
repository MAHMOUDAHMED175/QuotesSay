import 'package:carousel_slider/carousel_slider.dart';
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

class Quotess extends StatefulWidget {
  Quotess({Key? key}) : super(key: key);

  @override
  State<Quotess> createState() => _QuotesState();
}

class _QuotesState extends State<Quotess> {
  Future<void> _refresh(BuildContext context) async {
    QuotesCubit.get(context).getImageForQuote();
    QuotesCubit.get(context).getQuotes();
    // HomeLocalDataSourceImpl().getQuotes();
  }

  @override
  void initState() {
    _refresh(context);
    super.initState();
  }

//https://m.dreamscity.net/imgcache/2/9990dreamscity.jpg
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuotesCubit, QuotesState>(listener: (context, state) {
      if (state is QuotesSuccess) {
        QuotesCubit.get(context).quotes.addAll(state.quote);
      }
      if (state is QuotesImageSuccess) {
        QuotesCubit.get(context).imageQuote = state.imageQuote;
      }
      if (state is QuotesFailure) {
        QuotesCubit.get(context).quotes = HomeLocalDataSourceImpl().getQuotes();
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
      return RefreshIndicator(
        displacement: 50,
        backgroundColor: Colors.black,
        color: Colors.white,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () => _refresh(context),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ConditionalBuilder(
              condition: QuotesCubit.get(context).quotes.isNotEmpty &&
                  QuotesCubit.get(context).imageQuote.image.isNotEmpty,
              builder: (context) => CarouselSlider.builder(
                itemCount: QuotesCubit.get(context).quotes.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        // Text("${QuotesCubit.get(context).quotes[0]}"),
                        quotesItem(
                  context,
                  state,
                  image: QuotesCubit.get(context).imageQuote.image,
                  quotes: QuotesCubit.get(context).quotes[itemIndex],
                ),
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 15),
                  autoPlayAnimationDuration: const Duration(milliseconds: 2500),
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  animateToClosest: true,
                  disableCenter: true,
                  scrollDirection: Axis.vertical,
                ),
              ),
              fallback: (context) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.halfTriangleDot(
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
        ),
      );
    });
  }
}

// Widget noInternetConnectionListen(context) {
//   return SafeArea(
//     child: Center(
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.2,
//         width: MediaQuery.of(context).size.width * 0.9,
//         decoration: BoxDecoration(
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.grey,
//               spreadRadius: 12,
//               blurRadius: 8,
//               offset: Offset(0, 0), // changes position of shadow
//             ),
//           ],
//           borderRadius: BorderRadius.circular(AppSize.s20),
//           image: const DecorationImage(
//               image: AssetImage(ImageAssets.background),
//               colorFilter: ColorFilter.mode(Colors.red, BlendMode.difference),
//               fit: BoxFit.cover,
//               opacity: 0.7),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "No Internet Connection \nPlease Open Your Network",
//               maxLines: 3,
//               style: GoogleFonts.cairo(
//                 textStyle: StyleHelper.textStyle24Bold(
//                   context,
//                   color: ColorManager.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

///
