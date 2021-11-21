class RequestUtil {

 RequestUtil._private();

 static final RequestUtil _instance =
 RequestUtil._private();

 static RequestUtil get instance => _instance;

 static Uri getUri(String ?path) {
  const _authority = "localhost:8080";
  var _path = "/";
  if(path!.isNotEmpty) {
   _path += path;
  }

  return Uri.http(_authority, _path);
 }
}