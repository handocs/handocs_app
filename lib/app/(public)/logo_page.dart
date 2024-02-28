import 'package:flutter/material.dart';
import '../components/button.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,title: Text(widget.title),),
      body: Container(
          alignment: Alignment.center,
          //color: Colors.black87,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: const AssetImage("images/hexagonos_digitais.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.12), BlendMode.dstATop),
            ),
          ),
          child: Column(children: [
            const SizedBox(width: 100, height: 80),
            const Image(
              image: AssetImage('images/logo.png'),
              width: 200,
              height: 200,
            ),
            const SizedBox(width: 100, height: 80),
            HDButton.defaultButton('ENTRAR'),
            HDButton.defaultButton('CADASTRAR'),
          ])),
    );
  }
}
