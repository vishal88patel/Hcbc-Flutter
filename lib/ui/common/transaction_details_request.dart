class TransactionDetailRequest {
  final String description;
  final String tnxFromLine1;
  final String tnxFromLine2;
  final String tnxAmount1;
  final String tnxAmount2;
  final String tnxAmountCurrency;
  final String tnxDate;
  final String tnxType;
  final String drCr;

  TransactionDetailRequest(
      {required this.drCr,
      required this.tnxType,
      required this.description,
      required this.tnxFromLine1,
      required this.tnxFromLine2,
      required this.tnxAmount1,
      required this.tnxAmount2,
      required this.tnxAmountCurrency,
      required this.tnxDate});
}
