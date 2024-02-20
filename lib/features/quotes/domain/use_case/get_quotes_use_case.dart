import 'package:dartz/dartz.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/core/use_case/base_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';
import 'package:windowappflutter/features/quotes/domain/repository/home_repo.dart';

class GetQuotesUseCase extends BaseUseCase<List<QuotesEntity>, void> {
  final HomeRepo homeRepo;

  GetQuotesUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<QuotesEntity>>> call([void parameters]) async {
    return await homeRepo.getQuotes();
  }
}
