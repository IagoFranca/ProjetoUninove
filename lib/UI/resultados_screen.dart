import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetouninove/models/User.dart';

class ResultadoTela extends StatelessWidget {
  final String nomedouser;

  const ResultadoTela({Key? key, required this.nomedouser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
        appBar: AppBar(
          title: const Text('Resultados'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: FutureBuilder<User>(
            future: fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data!;
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(user.avatarUrl, height: 100),
                      ),
                      Container(
                        height: 15.0,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                      ),
                      Container(
                        height: 15.0,
                      ),
                      Text(
                        "Login: ${user.login}",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(153, 214, 214, 214)),
                      ),
                      Container(
                        height: 15.0,
                      ),
                      Text(
                        "Bio: ${user.bio}",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(153, 214, 214, 214)),
                      ),
                      Container(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(14.0),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              "Seguidores: ${user.followers}",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          Container(
                            width: 14.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(14.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 143, 7, 255),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              "Repositórios: ${user.public_repos}",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ));
  }

  Future<User> fetch() async {
    var url = ('https://api.github.com/users/$nomedouser');
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Algo deu errado');
    }
  }
}
