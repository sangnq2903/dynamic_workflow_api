import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
  var router = Router();

  // Define your API routes here
  router.get('/hello', (shelf.Request request) {
    return shelf.Response.ok('Hello, World!');
  });

  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(router);

  var server = await io.serve(handler, '127.0.0.1', 8080);
  print('Server running on ${server.address}:${server.port}');
}
