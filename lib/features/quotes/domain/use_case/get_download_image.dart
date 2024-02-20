import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/core/use_case/base_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/repository/home_repo.dart';

class GetDownloadImageUseCase extends BaseUseCase<String, DownloadImageParams> {
  final HomeRepo homeRepo;

  GetDownloadImageUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, String>> call([DownloadImageParams? params]) async {
    return await homeRepo.downloadImage(params!.imageUrl, params.context);
  }
}

class DownloadImageParams {
  final String imageUrl;
  final BuildContext context;

  DownloadImageParams({required this.imageUrl, required this.context});
}
