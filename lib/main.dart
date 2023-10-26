import 'package:flutter/material.dart';
import 'package:dito_sdk/dito_sdk.dart';

void main() {
  runApp(const MyApp());

  DitoSDK().initialize(
    apiKey: 'MjAxNC0wNS0yMCAxMTowMzoyMSAtMDMwMEdyYXBoIEFwaSBWMjQ0',
    secretKey: 'HNVksCIUywbCIBJOv3UjgqmA7p5chPPFrpBbqvFW',
  );
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
              DitoSDK().identifyUser();
            },
            child: const Text('Register User'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              DitoSDK().trackEvent(
                  eventName: 'comprou',
                  revenue: 19.00,
                  customData: {'produto': 'tenis'});
            },
            child: const Text('Track1'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              DitoSDK().trackEvent(
                  eventName: 'comprou',
                  revenue: 27.00,
                  customData: {'produto': 'camisa'});
            },
            child: const Text('Track2'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              DitoSDK().trackEvent(
                  eventName: 'comprou',
                  revenue: 32.00,
                  customData: {'produto': 'calca'});
            },
            child: const Text('Track3'),
          ),
        ],
      ),
    );
  }
}
