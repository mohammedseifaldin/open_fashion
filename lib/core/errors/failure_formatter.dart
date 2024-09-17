import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final int statusCode;

  const ServerFailure(super.message, this.statusCode);

  factory ServerFailure.dio(DioException e) {
    final int statusCode = e.response?.statusCode ?? -1;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("إتصال الشبكة ضعيف،حاول مجددا", statusCode);
      case DioExceptionType.sendTimeout:
        return ServerFailure("إتصال الشبكة ضعيف،حاول مجددا", statusCode);
      case DioExceptionType.receiveTimeout:
        return ServerFailure("إتصال الشبكة ضعيف،حاول مجددا", statusCode);
      case DioExceptionType.badCertificate:
        return ServerFailure(
            "شهادة خاطئة تأكد من الحصول على التطبيق الرسمي،او راجعنا بشكوى", statusCode);
      case DioExceptionType.cancel:
        return ServerFailure("تم قطع الإتصال", statusCode);
      case DioExceptionType.connectionError:
        return ServerFailure("تأكد من إتصالك بالإنترنت", statusCode);
      case DioExceptionType.unknown:
        return ServerFailure("عذرا هناك خطأ غير معروف", statusCode);
      case DioExceptionType.badResponse:
        if (e.response!.statusCode == 404) {
          return ServerFailure("تم فقدان الرابط المظلوب الوصول إلبه،حاول لاحقا", statusCode);
        } else {
          return ServerFailure(" ,خطأ في السبرفر حاول لاحقا", statusCode);
        }
    }
  }
}

class EmptyArgumentFailure extends Failure {
  const EmptyArgumentFailure(super.message);
}

class DataBaseFailure extends Failure {
  final int? statusCode;
  const DataBaseFailure(super.message, [this.statusCode = 0]);
}

class DecodeFailure extends Failure {
  const DecodeFailure(super.message);
}

Failure formatFailure(dynamic error) {
  if (kDebugMode) {
    log(error.toString());
  }
  if (error is DioException) {
    return ServerFailure.dio(error);
  }
  if (error is Response) {
    if (error.data is String && error.statusCode is int) {
      if (error.statusCode == 404) {
        return const ServerFailure("لم نتمكن من العثور على الصفحة", 404);
      }
      if (error.statusCode == 500) {
        return const ServerFailure("هناك خطأ في تنفيذ الطلب،أعد المحاولة أو أعلمنا بالمشكلة", 500);
      }
      return EmptyArgumentFailure("(${error.statusCode})${error.data}");
    }
  }
  if (error is FormatException) {
    return const DecodeFailure("عذراََ حدث خطأ في فك ترميز النتيجة أرسل شكوى لنا لنصلحه");
  } else {
    return const EmptyArgumentFailure("عذراً حدث خطأ غير متوقع ،حاول مجدداََ لاحقاََ");
  }
}
