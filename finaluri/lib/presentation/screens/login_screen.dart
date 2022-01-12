import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _userEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
            children: 
              [Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fitWidth,
                    width: width * 0.6,
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: const Color(0xffA8E3E8),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        fillColor: const Color(0xffA8E3E8),
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      controller: _userEditController,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: const Color(0xffA8E3E8),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: TextButton(
                      onPressed: () => {
                        Navigator.pushReplacementNamed(context, '/home')
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xffA8E3E8))),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
