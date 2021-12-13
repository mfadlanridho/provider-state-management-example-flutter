import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String data = 'secret';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyTextField(),
      Level2(),
    ]);
  }
}

class Level2 extends StatelessWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context).data,
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context).data,
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        Provider.of<Data>(context, listen: false).changeData(text);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'data';

  void changeData(String data) {
    this.data = data;
    notifyListeners();
  }
}
