import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum TransactionType { fetchHistory, fetchDetail }

class TransactionAPI implements APIRequestRepresentable {
  final TransactionType type;
  int? id;

  TransactionAPI._({required this.type, this.id});

  TransactionAPI.fetchHistory() : this._(type: TransactionType.fetchHistory);

  TransactionAPI.fetchDetail(int id)
      : this._(type: TransactionType.fetchDetail, id: id);

  @override
  String get endpoint => APIEndpoint.demoapi;

  @override
  String get path {
    switch (type) {
      case TransactionType.fetchHistory:
        return "/history";
      case TransactionType.fetchDetail:
        return "/transactions/$id";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers => {};

  @override
  Map<String, String> get query => {};

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
