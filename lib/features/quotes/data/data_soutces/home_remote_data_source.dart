import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:windowappflutter/core/network/remote/api_endpoints.dart';
import 'package:windowappflutter/core/network/remote/dioHelper.dart';
import 'package:windowappflutter/core/utils/constants_manager.dart';
import 'package:windowappflutter/features/quotes/data/models/image_quotes_model/ImageQuotes.dart';
import 'package:windowappflutter/features/quotes/data/models/quotes_model/QuotesModel.dart';
import 'package:windowappflutter/features/quotes/data/models/random_quote_model/RandomQuoteModel.dart';
import 'package:windowappflutter/features/quotes/data/models/today_quote_model/TodayQuoteModel.dart';

import '../../../../core/functions/save_data.dart';
import '../../../../core/utils/color_manager.dart';

abstract class HomeRemoteDataSource {
  Future<List<QuotesModel>> getQuotes();

  Future<ImageQuotesModel> getImageQuotes();

  Future<List<RandomQuoteModel>> getRandomQuote();

  Future<List<TodayQuoteModel>> getTodayQuote();

  Future<String> downloadImageWithText(String imageUrl, String text, context);

  Future<String> downloadImage(String imageUrl, context);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<QuotesModel>> getQuotes() async {
    final response = await apiService.getData(url: ApiEndPoints.quotesEndPoint);
    List<QuotesModel> result = List<QuotesModel>.from(
        (response.data as List).map((e) => QuotesModel.fromJson(e)));
    saveQuote(result, AppConstants.kQuotesBox);
    return result;
  }

  @override
  Future<ImageQuotesModel> getImageQuotes() async {
    final response =
        await apiService.getData(url: ApiEndPoints.imageQuoteEndpoint);
    ImageQuotesModel result = ImageQuotesModel.fromJson(response.data);
    return result;
  }

  @override
  Future<List<RandomQuoteModel>> getRandomQuote() async {
    final response = await apiService.getData(url: ApiEndPoints.randomEndPoint);
    List<RandomQuoteModel> result = List<RandomQuoteModel>.from(
        (response.data as List).map((e) => RandomQuoteModel.fromJson(e)));
    addQuoteRandomHive(result);

    return result;
  }

  @override
  Future<List<TodayQuoteModel>> getTodayQuote() async {
    final response = await apiService.getData(url: ApiEndPoints.todayEndPoint);
    List<TodayQuoteModel> result = List<TodayQuoteModel>.from(
        (response.data as List).map((e) => TodayQuoteModel.fromJson(e)));
    addQuoteTodayHive(result);

    return result;
  }

  @override
  Future<String> downloadImageWithText(
      String imageUrl, String text, context) async {
    Random random = Random();
    http.Response response = await http.get(Uri.parse(imageUrl));
    Uint8List imageData = response.bodyBytes;

    // Decode the image data into an img.Image object
    img.Image? image = img.decodeImage(imageData);

    // Resize the image if needed
    image = img.copyResize(image!, width: 800); // Resize width to 800px

    // Create a PictureRecorder and Canvas to draw on
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(
      recorder,
      Rect.fromPoints(
        Offset(0.0, 0.0),
        Offset(image.width.toDouble(), image.height.toDouble()),
      ),
    );

    // Convert the img.Image to a ui.Image
    Future<ui.Image> _convertImage(img.Image image) async {
      // Convert the img.Image to a Uint8List
      Uint8List byteData = img.encodePng(image);

      // Convert the Uint8List to a ui.Codec
      ui.Codec codec = await ui.instantiateImageCodec(byteData);

      // Get the first frame from the codec
      ui.FrameInfo frameInfo = await codec.getNextFrame();

      // Return the ui.Image
      return frameInfo.image;
    }

    ui.Image uiImage = await _convertImage(image);

    // Draw the image onto the canvas
    canvas.drawImage(uiImage, Offset.zero, Paint());

    // Add text to the image
    TextSpan span = TextSpan(
      style: GoogleFonts.lora(color: ColorManager.white, fontSize: 50),
      // style: StyleHelper.textStyle50Bold(context, color: ColorManager.white),
      text: text,
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      maxLines: 8,
      textDirection: TextDirection.ltr,
    );

    // Set text width
    double textWidth = 400; // Maximum width allowed for text
    tp.layout(maxWidth: textWidth);

    // Set line height and starting positions
    double lineHeight = tp.preferredLineHeight;
    double totalHeight = lineHeight * 8; // Total text height
    double startY = (image.height - totalHeight) /
        2; // Starting height from top of the image
    double startX =
        (image.width - textWidth) / 2; // Starting distance from left

    // Draw text on the image
    tp.paint(
        canvas, Offset(startX, startY)); // Draw text at the calculated position

    // Convert the canvas into an Image
    ui.Picture picture = recorder.endRecording();
    ui.Image imageWithText = await picture.toImage(image.width, image.height);

    // Convert the Image into bytes
    ByteData? byteData =
        await imageWithText.toByteData(format: ui.ImageByteFormat.png);
    Uint8List bytes = byteData!.buffer.asUint8List();

    // Get temporary directory
    final dir = await getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/SaveImage${random.nextInt(10000)}.png';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(bytes);
    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);
    return file.path;
  }

  @override
  Future<String> downloadImage(String imageUrl, context) async {
    Random random = Random();
    http.Response response = await http.get(Uri.parse(imageUrl));
    Uint8List imageData = response.bodyBytes;
    final dir = await getTemporaryDirectory();
    var filename = '${dir.path}/SaveImage${random.nextInt(10000)}.png';

    final file = File(filename);
    await file.writeAsBytes(imageData);
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);
    return file.path;
  }
}
