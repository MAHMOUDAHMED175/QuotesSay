import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_cubit.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_state.dart';

import '../../../../../core/utils/styles_manager.dart';
import '../widgets/item_favoriets/item_favoriets.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    QuotesCubit.get(context).fetchAllQuotesWithImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesCubit, QuotesState>(
      builder: (context, state) {
        var quoteAndImage = QuotesCubit.get(context).quotesWithImages;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ConditionalBuilder(
            condition: QuotesCubit.get(context).quotesWithImages!.isNotEmpty,
            builder: (context) => Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.08,
                  horizontal: MediaQuery.of(context).size.height * 0.008,
                ),
                child: CarouselSlider.builder(
                  itemCount: quoteAndImage!.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      // Text("${QuotesCubit.get(context).quotes[0]}"),
                      quotesItem(
                    state,
                    context,
                    quotesWithImagesHiveEntity: quoteAndImage[itemIndex],
                  ),
                  options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 15),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 2500),
                    autoPlayCurve: Curves.linear,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.4,
                    animateToClosest: true,
                    disableCenter: true,
                    scrollDirection: Axis.horizontal,
                  ),
                )

                ///

                ),
            fallback: (context) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.threeArchedCircle(
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
        );
      },
    );
  }
}
