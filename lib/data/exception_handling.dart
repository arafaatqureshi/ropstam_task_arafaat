class ExceptionHandling implements Exception{
  final _message;
  final _prefix;

  ExceptionHandling(this._message, this._prefix);

  String toString(){
    return "$_prefix + $_message";
  }
}
class FetchDataException extends ExceptionHandling{
  FetchDataException([String? message]): super(message, 'Error During Connection');
}

class BadRequestException extends ExceptionHandling{
  BadRequestException([String? message]): super(message, 'Invalid Request');
}

class UnauthorisedException extends ExceptionHandling{
  UnauthorisedException([String? message]): super(message, 'Unauthorised Request');
}