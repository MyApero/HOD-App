import "package:hod/core/failure.dart";
import 'package:either_dart/either.dart';

typedef MyFutureEither<T> = Future<Either<Failure, T>>;
