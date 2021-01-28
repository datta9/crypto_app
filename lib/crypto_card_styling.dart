import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {@required this.logo,
      @required this.cryptoCurrency,
      @required this.cryptoValue,
      @required this.selectedCurrency});

  final AssetImage logo;
  final String cryptoCurrency;
  final String cryptoValue;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 16.0, 0, 16.0),
                child: Image(
                  image: logo,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1 $cryptoCurrency',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$cryptoValue',
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' $selectedCurrency',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
