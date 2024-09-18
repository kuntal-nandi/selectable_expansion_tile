import 'package:flutter/material.dart';
import 'package:selectable_expansion_tile/selectable_expansion_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Selectable Expansion tile Example'),
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
  final ExpansionController _controller1 =
  ExpansionController(initialExpanded: true);
  final ExpansionController _controller2 = ExpansionController();
  int tileValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            SelectableExpansionTile(
              controller: _controller1,
              value: 1,
              groupValue: tileValue,
              header: Container(
                margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                ),
                child: RadioMenuButton(
                  value: 1,
                  groupValue: tileValue,
                  onChanged: (value) {
                    setState(() {
                      tileValue = value!;
                    });
                  },
                  child: const Text('Payment Gateway'),
                ),
              ),
              body: Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                ),
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 12, bottom: 12),
                child: const Text(
                  'E-payment system is the means of making payment and/or transaction for goods and services on an e-commerce website or electronic environment without any need to use cash or check. E-payment system is also known as online payment system.',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  setState(() {
                    tileValue = value;
                  });
                });
              },
            ),
            SelectableExpansionTile(
              controller: _controller2,
              value: 2,
              groupValue: tileValue,
              header: Container(
                margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                ),
                child: RadioMenuButton(
                  value: 2,
                  groupValue: tileValue,
                  onChanged: (value) {
                    setState(() {
                      tileValue = value!;
                    });
                    // if (_controller2.expanded == false) {
                    //   setState(() {
                    //     _controller2.toggle();
                    //   });
                    // }
                    //
                    // if (_controller1.expanded == true) {
                    //   _controller1.toggle();
                    // }
                  },
                  child: const Text('Bank Transfer'),
                ),
              ),
              body: Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                ),
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 12, bottom: 12),
                child: const Text(
                  'Bank transfer is the general term used to cover a wide range of credit transfers, including cash payments, giro-payments, and wire transfer to local banks. They are the most common form of cashless consumer payments in most countries within the European Union and Asia–Pacific (references: www.ecb.org and www.bis.org)',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  tileValue = value;
                });
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
