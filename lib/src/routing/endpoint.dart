part of minerva_routing;

typedef EndpointHandler = FutureOr<dynamic> Function(
    ServerContext context, MinervaRequest request);

typedef EndpointErrorHandler = FutureOr<dynamic> Function(
    ServerContext context, MinervaRequest request, Object error);

class Endpoint {
  final HttpMethod method;

  final String path;

  final EndpointHandler handler;

  final EndpointErrorHandler? errorHandler;

  final AuthOptions? authOptions;

  Endpoint(this.method, this.path, this.handler, this.errorHandler,
      this.authOptions);
}
