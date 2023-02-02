import 'package:flutter/material.dart';
import 'package:flutter_lerning_with_rest_api/app/presentation/user/user_list/ctrl/user_list_ctrl.dart';
import 'package:flutter_lerning_with_rest_api/app/presentation/user/user_list/page/update_user.dart';
import 'package:get/get.dart';

import '../../../../global_widgets/update_text_field.dart';

class UserListPage extends StatelessWidget {
   UserListPage({Key? key}) : super(key: key);
  var ctrl =Get.put(UserListCtrl());
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text("User Lists"),
       ),
       body: Obx(() {
         return ListView.builder(
           shrinkWrap: true,
           itemBuilder: (BuildContext context, index) {
             var data = ctrl.userList[index];
             return Container(
               height: 40,
               width: 100,
               decoration: BoxDecoration(
                 color: Colors.cyanAccent,
                 border: Border.all(color: Colors.white, width: 1),
               ),
               child: Padding(
                 padding: EdgeInsets.only(
                   left: 6.0,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     InkWell(
                       onTap: () {
                         UpdateTextFieldWidget(
                           nameController: ctrl.editData.value,
                           isEnable: true,
                           key: UniqueKey(),
                         );
                       },
                       child: Text(
                         data.fullName.toString(),
                         style: const TextStyle(
                             color: Colors.red,
                             height: 2,
                             fontWeight: FontWeight.w900),
                         textAlign: TextAlign.left,
                       ),
                     ),
                     SizedBox(
                       width: 90,
                     ),
                     Align(
                       alignment: Alignment.centerRight,
                       child: InkWell(
                           onTap: () {
                             ctrl.editData.value.text = data.username!;
                             Get.to(()=> UpdateUser(
                               isEnable: true,
                               data:data,
                               key: UniqueKey(),
                             ));
                           },
                           child: const Icon(Icons.edit)),
                     ),
                     Align(
                       alignment: Alignment.centerRight,
                       child: InkWell(
                           onTap: () {
                             // ctrl.deleteDataUser(data);
                          }, child: const Icon(Icons.delete)),
                     )
                   ],
                 ),
               ),
             );
           },
           itemCount: ctrl.userList.length,
         );
       }),
     );
     return GetX(builder: (_ctrl) {});
   }
}
