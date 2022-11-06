import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum PaymentType { fetchPayment, fetchDetail, fetchTopUp }

class PaymentAPI implements APIRequestRepresentable {
  final PaymentType type;
  int? id;
  String? methodType;
  bool? isTopUpSuccess;

  PaymentAPI._({required this.type, this.id, this.methodType, this.isTopUpSuccess});

  PaymentAPI.fetchPayment(String type)
      : this._(type: PaymentType.fetchPayment, methodType: type);

  PaymentAPI.fetchDetail(int id)
      : this._(type: PaymentType.fetchDetail, id: id);

  PaymentAPI.fetchTopUp(bool isTopUpSuccess)
      : this._(type: PaymentType.fetchTopUp, isTopUpSuccess: isTopUpSuccess);

  @override
  String get endpoint => APIEndpoint.demoapi;

  @override
  String get path {
    switch (type) {
      case PaymentType.fetchPayment:
        return "/payments";
      case PaymentType.fetchDetail:
        return "/payments/$id";
      case PaymentType.fetchTopUp:
        return "/topup-instant";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers => {};

  @override
  Map<String, String> get query {
    switch (type) {
      case PaymentType.fetchPayment:
        return {"type": "$methodType"};
      case PaymentType.fetchDetail:
        return {};
      case PaymentType.fetchTopUp:
        return {"status": "$isTopUpSuccess"};
    }
  }

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
