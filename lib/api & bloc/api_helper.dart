class ApiHelper {
  static const String BaseUrl = "http://10.5.33.173";
}

class ResponseCode {
  // 1xx Informational
  static const Continue = 100;

  // 2xx Success
  static const OK = 200; // Request is successfully completed.

  // 3xx Redirection
  static const MultipleChoices = 300;

  // 4xx Client error
  static const Failed = 4;
  static const NoData = 40;
  static const BadRequest = 400; // No internet
  static const Unauthorized = 401; // We could not recognize you.
  static const Forbidden =
      403; // Access to the requested resource or action is forbidden.
  static const NotFound = 404; // The requested resource could not be found.
  static const RequestTimeout = 408;

  // 5xx Server error
  static const InternalServerError =
      500; // We had a problem with our server. Try again later.
  static const ServiceUnavailable =
      503; // We're temporarily offline for maintenance. Please try again later.

  /// Business response codes
  static const Success = 200;
  static const ChangePass = 91001008; // Нууц үгээ солино уу
  static const SerializeError = 999; // json serializeError
  static const SessionExpired = 91001018; // Нэвтэрнэ үү

}

class HttpMethod {
  static const post = 'POST';
  static const get = 'GET';
  static const put = 'PUT';
  static const delete = 'DELETE';
}
