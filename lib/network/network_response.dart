class NetworkResponse {
  String? message;
  int? status;
  dynamic data;
  bool failed;

  NetworkResponse({this.message, this.status, this.data, this.failed = false});

  @override
  String toString() {
    return 'NetworkResponse{message: $message, status: $status, data: $data, failed: $failed}';
  }
}
