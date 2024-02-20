import 'package:dartz/dartz.dart';
import 'package:windowappflutter/core/errors/failure.dart';

abstract class BaseUseCase<Type, param> {
  Future<Either<Failure, Type>> call([param parameters]);
}
