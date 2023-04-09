
import 'package:arafaat_task_ropstam/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.status, this.message);
// handles the api responses
  ApiResponse.loading() : status =Status.LOADING;

  ApiResponse.completed() : status =Status.COMPLETED;

  ApiResponse.error() : status =Status.ERROR;

  @override
  String toString(){
    return 'status: $status \n message: $message \n data: $data';
  }

}