import 'package:flutter/material.dart';

class KTextWidget extends StatelessWidget {
  KTextWidget({Key? key, required this.nameController, required this.fullName,this.isObsecure})
      : super(key: key);
  TextEditingController nameController;
  var fullName;
   bool? isObsecure=false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding:  EdgeInsets.only(left: 12),
              child: Container(
                margin: const EdgeInsets.all(4),
                child: Text(fullName),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextField(
                enabled: isObsecure,
                controller: nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: fullName,
                ),
              ),
            ),
          ]),
    );
  }
}