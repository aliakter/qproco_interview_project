import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../domain/models/response.dart' as response;
import '../exceptions/http_exception.dart';
import 'package:qproco_interview_project/shared/data/remote/network_service.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
  handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          code: res.statusCode ?? 200,
          data: res.data,
          messageEn: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case DioException:
          e as DioException;
          if(e.response!.statusCode == 422){
            message = e.response?.data['message'] ?? 'The required field is not set yet';
            statusCode = 1;
            identifier = e.response?.data['status'] ?? 'Please insert the required field';
            break;
          }
          else if(e.response!.statusCode == 400){
            message = e.response?.data['message'] ?? 'Successfully failed';
            statusCode = 1;
            identifier = e.response?.statusCode.toString() ?? 'Successfully failed';
            break;
          }
          else if(e.response!.statusCode == 403){
            message = e.response?.data['message'] ?? 'Access denied for that action';
            statusCode = 1;
            identifier = e.response?.statusCode.toString() ?? 'No permission is given to execute that request';
            break;
          } 
          // else if((e.response!.statusCode == 422) && (e.response!.statusCode != null) && (e.response != null) && (e.response?.data['message']['nid'] != null)){
          //   message = e.response?.data['message']['nid'][0] ?? 'Internal Error occurred';
          //   // message = 'Credentials are mismatched';
          //   statusCode = 1;
          //   identifier = e.response?.data['status'] ?? 'Internal Error occurred';
          //   break;
          // }
          // else if((e.response!.statusCode == 422) && (e.response!.statusCode != null) && (e.response != null) && (e.response?.data['message']['otp_number'] != null)){
          //   message = e.response?.data['message']['otp_number'][0] ?? 'Internal Error occurred';
          //   // message = 'Credentials are mismatched';
          //   statusCode = 1;
          //   identifier = e.response?.data['status'] ?? 'Internal Error occurred';
          //   break;
          // }
          else if(e.response!.statusCode == 500){
            message = e.response?.data['message'] ?? "Server error";
            statusCode = 1;
            identifier = e.response?.data['status'] ?? 'For any possible reason serve throw error exception.';
            break;
          }
          else if(e.response!.statusCode == 401) {
            message = e.response?.data['message'] ?? "Unauthorized";
            statusCode = 1;
            identifier = e.response?.data['status'] ?? 'Sanctum token is missing from request';
            break;
          }
          else if(e.response!.statusCode == 404) {
            message = e.response?.data['message'] ?? e.response?.data['message'];
            // message = 'Credentials are mismatched';
            statusCode = 1;
            identifier = e.response?.data['status'] ?? 'Internal Error occurred';
            break;
          }
          else if(e.response!.statusCode == 423){
            message = e.response?.data['message'] ?? "Too many API requests on server";
            statusCode = 1;
            identifier = e.response?.data['status'] ?? 'any request that is repeated more the 60times/minutes. will get this block respons';
            break;
          }
          else if(e.response!.statusCode == 429){
            message = e.response?.data['message'] ?? "Blocked for to suspicious activity";
            statusCode = 1;
            identifier = e.response?.data['status'] ?? 'after crossing wrong password threshold limit, the system blocked account.';
            break;
          }
          message = e.response?.data['message'] ?? 'Internal Error occurred';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Something went wrong';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
