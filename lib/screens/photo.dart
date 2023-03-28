import 'package:apidata/model/photo_model.dart';
import 'package:flutter/material.dart';

import '../services/api/api_service.dart';



class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
   late List<PhotoModel>? _photoModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _photoModel = (await ApiService().usersPhoto())!.cast<PhotoModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _photoModel!.length,
      itemBuilder: (context, index) {
        return Card(child: ListTile(
                    leading: Image.network(_photoModel![index].thumbnailUrl.toString()),
                    title: Text(_photoModel![index].title.toString()),
                   

                    //  trailing: ,
                  ),);
      },
    );
  }
}
