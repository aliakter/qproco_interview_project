import 'package:dartz/dartz.dart';
import '../../exceptions/http_exception.dart';

class Response {
  String? messageEn;
  final dynamic data;
  int code;

  Response({required this.code, this.messageEn, this.data = const {}});

}
extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
