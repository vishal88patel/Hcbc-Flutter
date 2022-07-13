class AccountData {
  String? accountId2;
  String? fromAccount2;
  String? fromAccountNumber2;
  String? accountBalance2;
  String? toAccount2;
  String? toAccountNumber2;
  String? hkdAmount1;
  String? usdAmount2;
  String? usdToHkd2;
  String? fromInnerLine1;
  String? fromInnerLine2;
  String? fromInnerBalance;
  String? toInnerLine1;
  String? toInnerLine2;
  String? toInnerBalance;
  String? dateString2;
  String? refNumber2;
  String? submitedDate2;
  String? amountDr2;
  String? amountCr2;

  AccountData(
      {this.accountId2,
        this.fromAccount2,
        this.fromAccountNumber2,
        this.accountBalance2,
        this.toAccount2,
        this.toAccountNumber2,
        this.hkdAmount1,
        this.usdAmount2,
        this.usdToHkd2,
        this.fromInnerLine1,
        this.fromInnerLine2,
        this.fromInnerBalance,
        this.toInnerLine1,
        this.toInnerLine2,
        this.toInnerBalance,
        this.dateString2,
        this.refNumber2,
        this.submitedDate2,
        this.amountDr2,
        this.amountCr2});

  AccountData.fromJson(Map<String, dynamic> json) {
    accountId2 = json['account_id2'];
    fromAccount2 = json['from_account2'];
    fromAccountNumber2 = json['from_account_number2'];
    accountBalance2 = json['account_balance2'];
    toAccount2 = json['to_account2'];
    toAccountNumber2 = json['to_account_number2'];
    hkdAmount1 = json['hkd_amount1'];
    usdAmount2 = json['usd_amount2'];
    usdToHkd2 = json['usd_to_hkd2'];
    fromInnerLine1 = json['from_inner_line1'];
    fromInnerLine2 = json['from_inner_line2'];
    fromInnerBalance = json['from_inner_balance'];
    toInnerLine1 = json['to_inner_line1'];
    toInnerLine2 = json['to_inner_line2'];
    toInnerBalance = json['to_inner_balance'];
    dateString2 = json['date_string2'];
    refNumber2 = json['ref_number2'];
    submitedDate2 = json['submited_date2'];
    amountDr2 = json['amount_dr2'];
    amountCr2 = json['amount_cr2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id2'] = this.accountId2;
    data['from_account2'] = this.fromAccount2;
    data['from_account_number2'] = this.fromAccountNumber2;
    data['account_balance2'] = this.accountBalance2;
    data['to_account2'] = this.toAccount2;
    data['to_account_number2'] = this.toAccountNumber2;
    data['hkd_amount1'] = this.hkdAmount1;
    data['usd_amount2'] = this.usdAmount2;
    data['usd_to_hkd2'] = this.usdToHkd2;
    data['from_inner_line1'] = this.fromInnerLine1;
    data['from_inner_line2'] = this.fromInnerLine2;
    data['from_inner_balance'] = this.fromInnerBalance;
    data['to_inner_line1'] = this.toInnerLine1;
    data['to_inner_line2'] = this.toInnerLine2;
    data['to_inner_balance'] = this.toInnerBalance;
    data['date_string2'] = this.dateString2;
    data['ref_number2'] = this.refNumber2;
    data['submited_date2'] = this.submitedDate2;
    data['amount_dr2'] = this.amountDr2;
    data['amount_cr2'] = this.amountCr2;
    return data;
  }
}