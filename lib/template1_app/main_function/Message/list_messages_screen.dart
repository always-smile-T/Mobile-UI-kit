import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template1/template1_app/app_theme.dart';
import 'package:template1/template1_app/main_function/Message/messages_sreen.dart';


class ListMessScreen extends StatefulWidget {
  const ListMessScreen({Key? key}) : super(key: key);

  @override
  _ListMessScreenState createState() => _ListMessScreenState();
}
 late TextEditingController _searchController = TextEditingController();

class _ListMessScreenState extends State<ListMessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/mainavatar.png"),
                ),
                const Text("Message", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                IconButton(
                  onPressed: (){},
                  icon: Image.asset('assets/images/create.png'),
                ),
              ],
            ),
            Padding (padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.grey1,
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          controller: _searchController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Search",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: const Text("Cancel",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                child: TextButton(
                  child: Row(
                    children: [
                  const CircleAvatar(
                  radius: 20,
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Thu Thao", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text("click to chat with her", style: TextStyle(fontSize: 12, color: Colors.black))
                    ],
                  ),
                    ],
                  ),
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: gotoMessage), (route) => false);
                  } ,
                  style: TextButton.styleFrom(
                    onSurface: AppTheme.greenPrimary
                  ),
                )
            ),
          ],
        ),
      )
    );
  }
  void onToggleShowPass() {
    setState(() {
      _searchController.text = ''; //lay phu dinh
    });
  }
  Widget gotoMessage(BuildContext context) {
    return const MessagesSreen();
  }
}
