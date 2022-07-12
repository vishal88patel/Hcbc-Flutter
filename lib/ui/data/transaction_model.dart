class TransactionList {
  String? username;
  String? lastLogin;
  String? accountNamePartial;
  String? accountName;
  String? accountNumber;
  String? accountCurrency;
  String? accountFund1;
  String? accountFund2;
  String? accountFundType;
  String? tnxCurrency;
  String? currencyTotal1;
  String? currencyTotal2;
  String? date;
  String? dateString;
  String? tnxName;
  String? tnxType;
  String? tnxValue1;
  String? tnxValue2;
  String? tnxDesc;
  String? tnxFromLine1;
  String? tnxFromLine2;
  String? tnxAmountCurr;
  String? tnxAmount1;
  String? tnxAmount2;
  String? tnxDate;
  String? hkdTotal1;
  String? hkdTotal2;
  String? usdTotal1;
  String? usdTotal2;
  String? drCr;

  TransactionList(
      {this.username,
      this.lastLogin,
      this.accountNamePartial,
      this.accountName,
      this.accountNumber,
      this.accountCurrency,
      this.accountFund1,
      this.accountFund2,
      this.accountFundType,
      this.tnxCurrency,
      this.currencyTotal1,
      this.currencyTotal2,
      this.date,
      this.dateString,
      this.tnxName,
      this.tnxType,
      this.tnxValue1,
      this.tnxValue2,
      this.tnxDesc,
      this.tnxFromLine1,
      this.tnxFromLine2,
      this.tnxAmountCurr,
      this.tnxAmount1,
      this.tnxAmount2,
      this.tnxDate,
      this.hkdTotal1,
      this.hkdTotal2,
      this.usdTotal1,
      this.usdTotal2,
      this.drCr});

  TransactionList.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    lastLogin = json['last_login'];
    accountNamePartial = json['account_name_partial'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    accountCurrency = json['account_currency'];
    accountFund1 = json['account_fund_1'];
    accountFund2 = json['account_fund_2'];
    accountFundType = json['account_fund_type'];
    tnxCurrency = json['tnx_currency'];
    currencyTotal1 = json['currency_total_1'];
    currencyTotal2 = json['currency_total_2'];
    date = json['Date'];
    dateString = json['date_string'];
    tnxName = json['tnx_name'];
    tnxType = json['tnx_type'];
    tnxValue1 = json['tnx_value_1'];
    tnxValue2 = json['tnx_value_2'];
    tnxDesc = json['tnx_desc'];
    tnxFromLine1 = json['tnx_from_line1'];
    tnxFromLine2 = json['tnx_from_line2'];
    tnxAmountCurr = json['tnx_amount_curr'];
    tnxAmount1 = json['tnx_amount_1'];
    tnxAmount2 = json['tnx_amount_2'];
    tnxDate = json['tnx_date'];
    hkdTotal1 = json['hkd_total_1'];
    hkdTotal2 = json['hkd_total2'];
    usdTotal1 = json['usd_total_1'];
    usdTotal2 = json['usd_total2'];
    drCr = json['dr_cr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['last_login'] = lastLogin;
    data['account_name_partial'] = accountNamePartial;
    data['account_name'] = accountName;
    data['account_number'] = accountNumber;
    data['account_currency'] = accountCurrency;
    data['account_fund_1'] = accountFund1;
    data['account_fund_2'] = accountFund2;
    data['account_fund_type'] = accountFundType;
    data['tnx_currency'] = tnxCurrency;
    data['currency_total_1'] = currencyTotal1;
    data['currency_total_2'] = currencyTotal2;
    data['Date'] = date;
    data['date_string'] = dateString;
    data['tnx_name'] = tnxName;
    data['tnx_type'] = tnxType;
    data['tnx_value_1'] = tnxValue1;
    data['tnx_value_2'] = tnxValue2;
    data['tnx_desc'] = tnxDesc;
    data['tnx_from_line1'] = tnxFromLine1;
    data['tnx_from_line2'] = tnxFromLine2;
    data['tnx_amount_curr'] = tnxAmountCurr;
    data['tnx_amount_1'] = tnxAmount1;
    data['tnx_amount_2'] = tnxAmount2;
    data['tnx_date'] = tnxDate;
    data['hkd_total_1'] = hkdTotal1;
    data['hkd_total2'] = hkdTotal2;
    data['usd_total_1'] = usdTotal1;
    data['usd_total2'] = usdTotal2;
    data['dr_cr'] = drCr;
    return data;
  }
}
