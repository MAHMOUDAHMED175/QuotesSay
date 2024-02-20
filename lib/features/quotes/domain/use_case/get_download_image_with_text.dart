import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/core/use_case/base_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/repository/home_repo.dart';

class GetDownloadImageWithTextUseCase
    extends BaseUseCase<String, DownloadImageWithTextParams> {
  final HomeRepo homeRepo;

  GetDownloadImageWithTextUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, String>> call(
      [DownloadImageWithTextParams? parameters]) async {
    return await homeRepo.downloadImageWithText(
        parameters!.imageUrl, parameters.text, parameters.context);
  }
}

class DownloadImageWithTextParams {
  final String imageUrl;
  final String text;
  final BuildContext context;

  DownloadImageWithTextParams(
      {required this.imageUrl, required this.text, required this.context});
}
