import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_cubit.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuotesCubit, QuotesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: QuotesCubit.get(context)
              .screen[QuotesCubit.get(context).currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GNav(
                onTabChange: (index) {
                  QuotesCubit.get(context).changeIndex(index);
                },
                selectedIndex: QuotesCubit.get(context).currentIndex,
                rippleColor: Colors.grey[800]!,
                // tab button ripple color when pressed
                hoverColor: Colors.grey[700]!,
                // tab button hover colo
                haptic: true,
                // haptic feedback
                tabBorderRadius: 15,
                tabActiveBorder:
                    Border.all(color: Colors.purpleAccent, width: 1),
                // tab button border
                tabBorder: Border.all(color: Colors.grey, width: 1),
                // tab button border
                tabShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
                ],
                // tab button shadow
                curve: Curves.linear,
                // tab animation curves
                duration: Duration(milliseconds: 500),
                // tab animation duration
                gap: 1,
                // the tab button gap between icon and text
                color: Colors.grey[800],
                // unselected icon color
                activeColor: Colors.purple,
                // selected icon and text color
                iconSize: 24,
                // tab button icon size
                tabBackgroundColor: Colors.purple.withOpacity(0.1),
                // selected tab background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                // navigation bar padding
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'DayQuote',
                  ),
                  GButton(
                    icon: Icons.format_quote_outlined,
                    text: 'Quotes',
                  ),
                  GButton(
                    icon: Icons.format_quote,
                    text: 'Random',
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Favorite',
                  )
                ]),
          ),
        );
      },
    );
  }
}
