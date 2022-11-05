import 'package:intl/intl.dart';

extension NumberParser on double {
  String toBigNumberView() {
    if (this > 1000000) return "${(this / 1000000).toStringAsFixed(1)}M";
    if (this > 1000) return "${(this / 1000).toStringAsFixed(1)}K";

    return toStringAsFixed(0);
  }

  String toRupiah() {
    var formatter = NumberFormat.currency(locale: "ID");
    return formatter.format(this).replaceAll("IDR", "Rp ");
  }

  String toCurrencyLocale({locale = "ID", currency = true}) {
    var formatter = currency
        ? NumberFormat.currency(locale: locale)
        : NumberFormat("###,##0", locale);
    return formatter.format(this);
  }
}
