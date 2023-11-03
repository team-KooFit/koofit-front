import 'package:flutter_application_1/user.dart';
import 'package:gsheets/gsheets.dart';

class biohealthcareAPIConfig {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "biohealthcare-43b45",
  "private_key_id": "bde78be6d66f1184164b0ebdff5a6b045b29073c",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDeYfX+ldt+dcMM\nXqT6sVrPKidLEXLqwJePGAV87rDB6hbXis+RTxiw01KqdS0k/j/w7SmuG3w9MCz9\njAybfIx67qLWJ9ujL3zW1yaHtMljZR013jaj85LsDnlasGrgaYqvg9xo61A2fMy4\nE/Uo0Xo3YcUsgCjWJkQ2amSrXyZVmgSSqKHoigZNny7MHuGlIuySXruQ5tMv+DhQ\n8qtY7ppWqAigl0+ayu22g5zLABsqCzGUt4autC0yKycMdEnc6xFaYcfG3LegVutT\nV/gE94pmRpB5CtQZBypsu61y6ef43RS+gbKFNsUOX3q3rWOyvZOhKAvSIIxZMQkP\nT3WoEODtAgMBAAECggEAMMKOd1Cg9Li5+HGdH3m5RVDDFlbgWWA6qw2zkFneyFn9\nQawGSKBs88KWLtlr+V9FIlzCBZKxulHgn4RwdDxKKh8+dZH+Oujr6Mh6goltmd1f\nGwNa/DZpSdh/m9awTH3fwo25S4kDCLtzAM6hc96Ae3m0y8XbDl+MF9lasue1RlHL\nAYm8aRGvK7S63Ejlzav1gu3OZbOUWxX9lfO9mmtrwZLu01+VZFB1bW1kBst5jTAr\n4MNI7D1nzQXtnhqZVyhKWG/E7pTK9iuVdb0DiW5HYSlxwmg6J9VQBPk/33uS41hS\nOHu/KPndGr2LrV9Sq9pNNgcYGur/EKXrPZ3jjmvisQKBgQD5E+7Es74g/wNR1AUb\nfqT6L2PVsA5yjJWeN4fYvuN//ZGOQgyj4IYafMXsWL8pNubwkMzQt4uvH+o7a3qN\n9EjRno+cLhCJ3KjQX5bM4mPMbytC/tpXG0tn/hikLVx49cKnbvuMuOfVYkjNWEni\nfJ2a0kFE8jNt0IFE8BG/0cErfQKBgQDkkBra/L0/UyUDJrx804IwItk9PnE3sQVf\nN3PM8CcYrGf4kjmmxbjkK3qLaN6YNjGuVcLtGBsigcOGjuKBBTz7m9c0l30VPOqL\npTiedVPbDLTN5XkI+1+c7RNRuxtmnRuDNqVKX4hiZVQQwHEDKCY7mbaUdR0Hc6bN\ndgVjj58mMQKBgGvQhPoAE7yUpgs1i0BrgV4KRVyp6JcM43ao8tSPTEqKqAa78Fy/\nQ00T1ViI0bY1XaGkDAQMbxpO5kTyMQphQ2P5DpC8H8yNB0WrGst08136gO9vAXPT\nDMDm7COkvvJc7vUqxRgUscVb1ceM/+5Zop7xg+8kJ77REiOVBxnQ4ZzBAoGAMFrQ\nY63+t6v2c6E5VUtGCrsErLFOMJMR6OAJbr0L+GtZH7yH1+GSySrtpRrNpPQqNJDO\nSWzFKNq9K/WEs/kQusZwlB7Mhra5hEuzG8sEr54Tjk/S+HR9+OwrHypvlJj+Xhcs\nhvyJFRAM5fJgtmNDG27csrHIL3BnRKaIY1TaPbECgYApgHHzx1fdwm2re0z3hsC7\nmEchAInPchyGvJ0ULRr2WNZat4eurtT0tf8ZeNLLK4pB4Q4DZtg4zcUTcsi1tFaa\n5yWAkvTYDgDeevPHarPqg/ab9z0WW9vhsy4Mt7o4fIGwME/c68Uu9x7l101XFWYa\nv4ugIpZxCkVZ/2u9jMtRew==\n-----END PRIVATE KEY-----\n",
  "client_email": "fooddatagsheets@biohealthcare-43b45.iam.gserviceaccount.com",
  "client_id": "103093735126220995857",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fooddatagsheets%40biohealthcare-43b45.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  static final String _spreadsheetId = '1QzTEHSf-zVoi_pWiI4fApI3AbE4-hzTLDCtpfv5Stck';
  static final _biohealthcareGSheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async{
    try{
      final spreadsheet = await _biohealthcareGSheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet,title:'FoodData');

      final firstRow = UserField.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    }
    catch(e){
      print('Init Error: $e');
    }
  }



  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet,{
      required String title,
  }) async{
    try{
    return await spreadsheet.addWorksheet(title);
  } catch (e){
      return spreadsheet.worksheetByTitle(title)!;
    }
}

class HeavyUserEventService {
  final String _workSheetTitle = 'FoodData';

  Spreadsheet spreadsheet;
  Worksheet workSheet


  Future<void> initalWorkSheet() async {
    final gsheet = biohealthcareAPIConfig.biohealthcareGSheets;
    spreadsheet ?? = await gsheet.spreadsheet(_spreadsheetId);

    if(worksheet==null){
    workSheet= await spreadsheet.worksheetByTitle(_workSheetTitle);
    workSheet ??= await spreadsheet.addWorksheet(_workSheetTitle);
    
    void insertRow({
      List<dynamic> row,
    }) async {
      if (workSheet == null){
        return;
    }
      final result = await workSheet.values.insertRow(row, values)
    }
    }
  }
}  
