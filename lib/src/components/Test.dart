import 'package:flutter/material.dart';
import 'package:uni_flutter/src/service/health_check_service.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String _text = "";

  void _onPress() async {
    String res = await healthCheckRequest();
    setState(() {
      _text = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(children: [
      IconButton(
          onPressed: () => _onPress(), icon: const Icon(Icons.add_circle)),
      Text(_text)
    ]);
  }
}
