import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:windowappflutter/core/functions/service_locator.dart';
import 'package:windowappflutter/core/utils/blocOpserver.dart';
import 'package:windowappflutter/core/utils/constants_manager.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';
import 'package:windowappflutter/features/quotes/domain/entities/random_quote.dart';
import 'package:windowappflutter/features/quotes/domain/entities/today_quote.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_download_image.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_download_image_with_text.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_image_quotes.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_quotes_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_random_quote_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/use_case/get_today_quote_use_case.dart';
import 'package:windowappflutter/features/quotes/presentation/view/screens/home_screen.dart';
import 'package:windowappflutter/features/quotes/presentation/view_model/managers/cubit/quotes_cubit.dart';

import 'features/quotes/domain/entities/quotes_with_images_hive_entity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(QuotesEntityAdapter());
  Hive.registerAdapter(RandomQuoteEntityAdapter());
  Hive.registerAdapter(TodayQuoteEntityAdapter());
  Hive.registerAdapter(QuotesWithImagesHiveEntityAdapter());
  await Hive.openBox<QuotesEntity>(AppConstants.kQuotesBox);
  await Hive.openBox<QuotesWithImagesHiveEntity>(
      AppConstants.kQuotesWithImagesBox);
  await Hive.openBox<RandomQuoteEntity>(AppConstants.kQuotesRandomBox);
  await Hive.openBox<TodayQuoteEntity>(AppConstants.kQuotesTodayBox);
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return QuotesCubit(

              getDownloadImageUseCase:gitLocator.get<GetDownloadImageUseCase>() ,
              getDownloadImageWithTextUseCase:gitLocator.get<GetDownloadImageWithTextUseCase>() ,
              getImageQuotesUseCase: gitLocator.get<GetImageQuotesUseCase>(),
              getQuotesUseCase: gitLocator.get<GetQuotesUseCase>(),
              getRandomQuoteUseCase: gitLocator.get<GetRandomQuoteUseCase>(),
              getTodayQuoteUseCase: gitLocator.get<GetTodayQuoteUseCase>(),


              // GetImageQuotes
            )
              ..getQuotes()
              ..getImageForQuote()
              ..getRandomQuote()
              ..getTodayQuote();
          }),
        ],
        child: OverlaySupport.global(
          child: MaterialApp(
            title: 'QuotesSay',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          ),
        ));
  }
}
