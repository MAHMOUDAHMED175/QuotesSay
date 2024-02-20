import 'package:dartz/dartz.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/core/use_case/base_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/entities/imageEntity.dart';
import 'package:windowappflutter/features/quotes/domain/repository/home_repo.dart';

class GetImageQuotesUseCase extends BaseUseCase<ImageEntity, void> {
  final HomeRepo homeRepo;

  GetImageQuotesUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, ImageEntity>> call([void parameters]) async {
    return await homeRepo.getImageQuotes();
  }
}
