abstract class IPostException {
  final String message;
  final StackTrace? stackTrace;

  const IPostException(this.message, [this.stackTrace]);
}

class ArgumentsException extends IPostException {
  const ArgumentsException(super.message, [super.stackTrace]);
}

class DataSourcePostException extends IPostException {
  const DataSourcePostException(super.message, [super.stackTrace]);
}