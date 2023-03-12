import 'package:apidata/model/data.dart';
import 'package:apidata/services/api_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  late List<Welcome> welcomemodel = [];
  void initState() {
    super.initState;
    getdata();
  }

  void getdata() async {
    welcomemodel = (await ApiService().getdata())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: welcomemodel == null || welcomemodel.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: welcomemodel.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(welcomemodel[index].avatar.toString()),
                      ),
                      title: Text(welcomemodel[index].nama.toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(welcomemodel[index].id.toString()),
                          Text(welcomemodel[index].nama.toString()),
                          Text(welcomemodel[index].alamat.toString()),
                          Text(welcomemodel[index].email.toString()),
                          Text(welcomemodel[index].pekerjaan.toString()),
                          Text(welcomemodel[index].quote.toString()),
                        ],
                      ),

                      //  trailing: ,
                    ),
                  );
                },
              ));
  }
}
