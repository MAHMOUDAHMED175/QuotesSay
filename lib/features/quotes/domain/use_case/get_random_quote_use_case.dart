import 'package:dartz/dartz.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/core/use_case/base_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/entities/random_quote.dart';
import 'package:windowappflutter/features/quotes/domain/repository/home_repo.dart';

class GetRandomQuoteUseCase extends BaseUseCase<List<RandomQuoteEntity>, void> {
  final HomeRepo homeRepo;

  GetRandomQuoteUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<RandomQuoteEntity>>> call(
      [void parameters]) async {
    return await homeRepo.getRandomQuote();
  }
}
