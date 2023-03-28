
import 'package:apidata/model/user_model.dart';
import 'package:apidata/services/api/api_service.dart';
import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  late List<UserModel> usermodelmodel = [];
  void initState() {
    super.initState;
    getdata();
  }

  void getdata() async {
    usermodelmodel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: usermodelmodel == null || usermodelmodel.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: usermodelmodel.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      
                      title: Text(usermodelmodel[index].name.toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(usermodelmodel[index].id.toString()),
                          Text(usermodelmodel[index].email.toString()),
                          
                        ],
                      ),

                      //  trailing: ,
                    ),
                  );
                },
              ));
  }
}
