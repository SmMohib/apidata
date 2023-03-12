import 'package:apidata/model/user_model.dart';
import 'package:apidata/services/api_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(_userModel![index].id.toString()),
                    title: Text(_userModel![index].username.toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'User Name: ${_userModel![index].username.toString()}'),
                        Text(_userModel![index].email.toString()),
                        Text(_userModel![index].address.toString()),
                        Text(_userModel![index].phone.toString()),
                        Text(_userModel![index].website.toString()),
                        Text(_userModel![index].company.toString()),
                      ],
                    ),

                    //  trailing: ,
                  ),
                );
                // return Card(
                //   child: Column(
                //     children: [
                //       Text(_userModel![index].id.toString()),
                //       Text(_userModel![index].username.toString()),
                //       const SizedBox(
                //         height: 20.0,
                //       ),
                //       Text(_userModel![index].email.toString()),
                //       Text(_userModel![index].website.toString()),
                //     ],
                //   ),
                // );
              },
            ),
    );
  }
}
