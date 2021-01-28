import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'crypto_card_styling.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCurrency = 'AUD';

  DropdownButton<String> dropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(fontSize: 25.0),
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      underline: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
      ),
      elevation: 16,
      iconSize: 40.0,
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  Future getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'C   R   Y   P   T   O',
        ),
        centerTitle: true,
        actions: [Icon(Icons.settings)],
      ),
      body: Column(
        children: [
          CryptoCard(
            logo: AssetImage('images/bitcoin.png'),
            cryptoCurrency: 'BTC',
            cryptoValue: isWaiting ? 'loading..' : coinValues['BTC'],
            selectedCurrency: selectedCurrency,
          ),
          CryptoCard(
            logo: AssetImage('images/etherium.png'),
            cryptoCurrency: 'ETH',
            selectedCurrency: selectedCurrency,
            cryptoValue: isWaiting ? 'Loading..' : coinValues['ETH'],
          ),
          CryptoCard(
            logo: AssetImage('images/litecoin.png'),
            cryptoCurrency: 'LTC',
            selectedCurrency: selectedCurrency,
            cryptoValue: isWaiting ? 'Loading..' : coinValues['LTC'],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 16.0),
            color: Colors.grey,
            width: double.infinity,
            height: 70,
            child: dropdown(),
          )
        ],
      ),
    );
  }
}
