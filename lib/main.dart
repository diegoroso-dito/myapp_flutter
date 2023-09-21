import 'package:flutter/material.dart';
import 'package:dito_flutter_sdk/dito_flutter_sdk.dart';

void main() {
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
  int _counter = 0;

  void _setUser() {
    DitoSDK().identify(
      name: "Roso",
      email: "roso@cs.com",
      gender: "masculino",
      birthday: '20/07/1995',
      registrationDate: '20/09/2023',
      city: 'Piracaia',
      customData: {
        'atributo1': 'valorAtributo1',
        'atributo2': 'valorAtributo2',
      },
    );
  }

  void _tracker() {
    // DitoSDK().trackEvent('NomeDoEvento', {'teste': 'teste'});
    String sha1 = DitoSDK().convertToSHA1('DiegoRoso');
    print(sha1);
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
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _setUser,
            tooltip: 'Decrement',
            child: const Text(
              'setUser',
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _tracker,
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
