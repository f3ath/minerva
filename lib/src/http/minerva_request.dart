part of minerva_http;

class MinervaRequest {
  final HttpRequest _request;

  final AuthContext _authContext = AuthContext();

  final Map<String, num> _pathParameters = {};

  AuthContext get authContext => _authContext;

  HttpSession get session => _request.session;

  String get method => _request.method;

  Uri get uri => _request.uri;

  HttpHeaders get headers => _request.headers;

  Future<String> get body => utf8.decodeStream(_request);

  Future<Map<String, dynamic>> get json =>
      body.then(((value) => jsonDecode(value)));

  Future<int> get length => _request.length;

  List<Cookie> get cookies => _request.cookies;

  X509Certificate? get certificate => _request.certificate;

  HttpConnectionInfo? get connectionInfo => _request.connectionInfo;

  int get connectionLength => _request.contentLength;

  Uri get requestedUri => _request.requestedUri;

  bool get persistentConnection => _request.persistentConnection;

  String get protocolVersion => _request.protocolVersion;

  Map<String, num> get pathParameters => Map.unmodifiable(_pathParameters);

  MinervaRequest(HttpRequest request) : _request = request;

  void addPathParameter(String key, num value) {
    _pathParameters[key] = value;
  }

  void addPathParameters(Map<String, num> pathParameters) {
    _pathParameters.addAll(pathParameters);
  }

  void removePathParameter(String key) {
    _pathParameters.remove(key);
  }

  void removePathParameters() {
    _pathParameters.clear();
  }
}
