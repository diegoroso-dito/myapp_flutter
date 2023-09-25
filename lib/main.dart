import 'package:flutter/material.dart';
import 'package:dito_flutter_sdk/dito_flutter_sdk.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _identify() {
    DitoSDK().identify(
      cpf: '43536713831',
      name: "Diego Roso",
      email: "diego.silva@dito.com.br",
      gender: "male",
      birthday: "1995-07-20",
      location: "Piracaia-SP",
      customData: {'Attr2': 'Attr2Value'},
    );
  }

  void _register() {
    DitoSDK().registerUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _identify,
            tooltip: 'Decrement',
            child: const Text(
              'setUser',
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _register,
            tooltip: 'Increment',
            child: const Text(
              'Tracker',
            ),
          ),
        ],
      ),
    );
  }
}
