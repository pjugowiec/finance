class RequestUtil {
  RequestUtil._private();

  static final RequestUtil _instance = RequestUtil._private();

  static RequestUtil get instance => _instance;

  static Uri getUri(String? path, Map<String, dynamic> queryParameters) {
    const _authority = "localhost:8080";
    var _path = "/";
    if (path!.isNotEmpty) {
      _path += path;
    }

    if (queryParameters.isNotEmpty) {
      return Uri.http(_authority, _path, queryParameters);
    }

    return Uri.http(_authority, _path);
  }
}
