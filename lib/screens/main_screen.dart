import 'package:flutter/material.dart';
import 'package:footballmanager/services/networking.dart';
import 'package:footballmanager/model/team.dart';
import 'package:footballmanager/screens/team_screen.dart';

class MyHomePage extends StatefulWidget {
  static final screeen_id = 'main_screen';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Networking networking = Networking();
  Future<List<Team>> teams;

  @override
  void initState() {
    super.initState();
    teams = networking.fetchTeams();
  }

  @override
  Widget build(BuildContext context) {
    networking.fetchTeams();
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Manager'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<List<Team>>(
            future: teams,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data[index].name;
                      String crestUrl = snapshot.data[index].crestUrl;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TeamScreen(team: snapshot.data[index]),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FadeInImage.assetNetwork(
                                    height: 50.0,
                                    placeholder: 'images/placeholder.png',
                                    image: crestUrl ?? ''),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
