import 'package:dio/dio.dart';

/// Base failure class
abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

/// Specific failure class for handling Dio errors
class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  /// Factory constructor to handle Dio exceptions and return a meaningful error message
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: "Connection timed out. Please check your internet.");

      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: "Request timed out while sending data. Try again.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: "Response took too long to arrive. Try again later.");

      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage:
                "Invalid SSL certificate detected. Secure connection required.");

      case DioExceptionType.badResponse:
        return ServerFailure(
          errorMessage:
              "Bad response from server: ${dioException.response?.statusCode} - ${dioException.response?.statusMessage ?? 'Unknown error'}",
        );

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage: "Network error. Check your internet connection.");

      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: "An unknown error occurred: ${dioException.message}");
    }
  }
}
