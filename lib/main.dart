import 'package:flutter/material.dart';
import 'package:sdk_mobile_flutter/sdk_mobile_flutter.dart';

void main() {
  DitoSDK().initialize(
    apiKey: 'MjAxNC0wNS0yMCAxMTowMzoyMSAtMDMwMEdyYXBoIEFwaSBWMjQ0',
    secretKey: 'HNVksCIUywbCIBJOv3UjgqmA7p5chPPFrpBbqvFW',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp - DitoSDK',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyApp - DitoSDK'),
          backgroundColor: Colors.blue,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              DitoSDK().setUserId('43536713831');
            },
            child: const Text('Set User ID'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              DitoSDK().identify(
                cpf: '43536713831',
                name: "Diego Roso",
                email: "diego.silva@dito.com.br",
                gender: "male",
                birthday: "1995-07-20",
                location: "Piracaia-SP",
                customData: {'Cargo': 'Tech Lead'},
              );
            },
            child: const Text('Identify User'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              DitoSDK().registerUser();
            },
            child: const Text('Register User'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              DitoSDK().trackEvent(
                  eventName: 'comprou',
                  revenue: 99.00,
                  customData: {'produto': 'tenis'});
            },
            child: const Text('Track'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              DitoSDK().setUserAgent('MyApp/1.0 (Android 12; Google Pixel 6)');
            },
            child: const Text('GetUserAgent'),
          ),
        ],
      ),
    );
  }
}
