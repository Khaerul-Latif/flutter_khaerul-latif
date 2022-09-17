import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 120.0,
              height: 80.0,
              child: BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: 'Alterra Academy',
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(
              width: 120.0,
              height: 80.0,
              child: BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: 'Flutter Asik',
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(
              width: 120.0,
              height: 80.0,
              child: BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: 'Khaerul Latif',
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
