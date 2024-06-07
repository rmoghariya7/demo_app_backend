class ErrorResponse extends Error {
  constructor(
    statusCode,
    message = "Something went wrong, please try again later"
  ) {
    super(message);
    this.message = message;
    this.statusCode = statusCode;
  }
}

export default ErrorResponse;
