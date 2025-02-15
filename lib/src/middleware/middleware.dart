part of minerva_middleware;

abstract class Middleware {
  const Middleware();

  FutureOr<void> initialize(ServerContext context) {}

  FutureOr<dynamic> handle(
      MiddlewareContext context, MiddlewarePipelineNode? next);

  FutureOr<void> dispose(ServerContext context) {}
}
