part of minerva_middleware;

class StaticFilesMiddleware extends Middleware {
  final String _directory;

  final String _path;

  final String? _root;

  late final String _directoryPath;

  StaticFilesMiddleware(
      {required String directory, required String path, String? root})
      : _directory = directory,
        _path = path,
        _root = root {
    _initialize();
  }

  void _initialize() {
    _directoryPath = '/${HostEnvironment.contentRootPath}$_directory';
  }

  @override
  Future<dynamic> handle(
      MiddlewareContext context, MiddlewarePipelineNode? next) async {
    var request = context.request;

    var requestPath = request.uri.path;

    if (requestPath.startsWith(_path)) {
      var filePath = requestPath.substring(_path.length, requestPath.length);

      if (filePath != '/' && filePath.isNotEmpty) {
        return _handleFile(filePath);
      } else {
        if (_root != null) {
          return _handleFile(_root!);
        } else {
          return NotFoundResult();
        }
      }
    }

    if (next != null) {
      return await next.handle(context);
    } else {
      return NotFoundResult();
    }
  }

  Future<Result> _handleFile(String filePath) async {
    if (filePath.isNotEmpty && filePath[0] != '/') {
      filePath = '/$filePath';
    }

    var file = File.fromUri(Uri.file('$_directoryPath$filePath'));

    if (await file.exists()) {
      var bytes = await file.readAsBytes();

      var mimeType = lookupMimeType((basename(filePath))) ?? 'text/html';

      var mimeSegments = mimeType.split('/');

      var headers = MinervaHttpHeaders(
          contentLength: bytes.length,
          contentType: ContentType(mimeSegments.first, mimeSegments.last,
              charset: 'utf-8'));

      return Result(statusCode: 200, body: bytes, headers: headers);
    } else {
      return NotFoundResult();
    }
  }
}
