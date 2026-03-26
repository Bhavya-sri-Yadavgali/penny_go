import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  factory ApiException.fromDioError(DioException dioError) {
    String message;
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        message = "Connection timed out. Please check your internet.";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.cancel:
        message = "Request to server was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection.";
        break;
      default:
        message = "Something went wrong. Please try again.";
        break;
    }
    return ApiException(message: message, statusCode: dioError.response?.statusCode);
  }

  static String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'] ?? 'Bad request';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Forbidden. Access denied.';
      case 404:
        return 'Requested resource not found.';
      case 500:
        return 'Internal server error. Please try later.';
      default:
        return 'Oops! Something went wrong.';
    }
  }

  @override
  String toString() => message;
}
