import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projetouninove/UI/resultados_screen.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController _nomedouser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            // height: 400.0,
            color: Color.fromARGB(255, 223, 223, 223),
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Image.asset(
                'assets/images/github.png',
                height: 100.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 10.0,
                ),
                Text(
                  "Consulta de Usuários no GitHub",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 22, 22, 22)),
                ),
                Container(
                  height: 20.0,
                ),
                TextField(
                  controller: _nomedouser,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0)),
                      hintText: 'Nome de Usuário',
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                Container(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    fixedSize: const Size(double.maxFinite, 40),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    primary: Color.fromARGB(255, 44, 177, 99),
                    onSurface: Colors.green,
                    elevation: 10,
                    shadowColor: Color.fromARGB(255, 88, 88, 88),
                  ),
                  child: Text('Pesquisar'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultadoTela(
                                nomedouser: _nomedouser.value.text)));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
