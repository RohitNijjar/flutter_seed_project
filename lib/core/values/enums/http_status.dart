enum HttpStatus {
  ok(200),
  created(201),
  badRequest(400),
  unauthorized(401),
  forbidden(403),
  notFound(404),
  conflict(409),
  unprocessableEntity(422),
  tooManyRequests(429),
  internalServerError(500);

  final int code;
  const HttpStatus(this.code);
}
