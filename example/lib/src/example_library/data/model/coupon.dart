class Coupon {
  final String tag;
  final DateTime validFrom;
  final DateTime validUntil;
  final double totalDiscount;

  const Coupon({
    required this.tag,
    required this.validFrom,
    required this.validUntil,
    required this.totalDiscount,
  });
}
