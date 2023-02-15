import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 200,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              top: 50.0,
            ),
            child: Image.asset(
              "assets/image/ConfringoLogin.png",
              scale: 1.5,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(243, 246, 249, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              /*  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "LOGIN",
                      style: TextStyle(fontFamily: 'BakBak', fontSize: 35.0),
                    )
                  ]), */
            ),
          )
        ],
      ),
    );
  }
}
