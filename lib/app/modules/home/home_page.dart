import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_list_modular/app/modules/home/home_module.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = HomeModule.to.get<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: StreamBuilder<List<String>>(            
                stream: bloc.item$,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.red,
                        child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          child: Text(snapshot.data[index], style: TextStyle(color: Colors.white , fontSize: 20),)),
                      );
                    },
                  );
                }),
          ),
          Divider(),
          Expanded(
            child: StreamBuilder<List<String>>(
                stream: bloc.item2$,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data[index]),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
