import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const String coinAPIKey = '241D1EEC-DDDE-48ED-AD07-6BDDECCEC074';
// const coinAPIKey = '6D350F8C-CC63-4582-B50B-A0489A335DDE'; nikash.deka@gmail.com

class CoinData {
  //
  Future getCoinData() async {
    String requestURL = '$coinAPIURL/BTC/USD?apikey=$coinAPIKey';
    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

// API Key: 241D1EEC-DDDE-48ED-AD07-6BDDECCEC074
