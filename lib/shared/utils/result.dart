import 'package:fpdart/fpdart.dart';
import '../errors/failure.dart';

/// A standard type for returning a result that might be a [Failure] or a value of type [T].
typedef Result<T> = Either<Failure, T>;
