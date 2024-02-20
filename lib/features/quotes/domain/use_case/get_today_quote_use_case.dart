import 'package:dartz/dartz.dart';
import 'package:windowappflutter/core/errors/failure.dart';
import 'package:windowappflutter/core/use_case/base_use_case.dart';
import 'package:windowappflutter/features/quotes/domain/entities/today_quote.dart';
import 'package:windowappflutter/features/quotes/domain/repository/home_repo.dart';

class GetTodayQuoteUseCase extends BaseUseCase<List<TodayQuoteEntity>, void> {
  final HomeRepo homeRepo;

  GetTodayQuoteUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<TodayQuoteEntity>>> call(
      [void parameters]) async {
    return await homeRepo.getTodayQuote();
  }
}
