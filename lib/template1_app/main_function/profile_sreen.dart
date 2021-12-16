import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:template1/template1_app/app_theme.dart';
import 'package:template1/template1_app/login_page_screen.dart';

class ProfileSreen extends StatefulWidget {
  const ProfileSreen({Key? key}) : super(key: key);

  @override
  _ProfileSreenState createState() => _ProfileSreenState();
}

class _ProfileSreenState extends State<ProfileSreen>
    with SingleTickerProviderStateMixin {
  bool _setState = true;

  final ScrollController _scrollController =  ScrollController();

  late TabController _controller;
  void initState() {
    _controller =
        TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 2, child: Scaffold(
        body:   Container(
            color: Colors.white70,
            child: Column(
              children: [
                Container (
                    height: 200,
                    color: AppTheme.greenPrimary,
                    child: Stack (
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(16, 35, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: Image.asset('assets/images/setting.png'),
                              ),
                              const Text("Profile", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                              IconButton(
                                onPressed: (){
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (BuildContext context) => const LoginPage()), (route) => false);
                                },
                                icon: Image.asset('assets/images/shutdown.png'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 98,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 3,
                                    color: Colors.white
                                )
                            ),
                            width: 138,
                            height: 138,
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage("assets/images/avatar.png"),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 238,
                            child: SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:const [
                                  Text("Thu Thao", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                                  Text("Never give up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
                                ],
                              ),
                            )),
                      ],
                    )
                ),
                Container(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: AppTheme.grey1
                    ),
                    child: TabBar(
                      //controller: _controller,
                      onTap: (value) {
                        if(value == 0){
                        setState(() {
                          _setState = true;
                        });}
                        else {
                          setState(() {
                            _setState = false;
                          });}
                      },
                      unselectedLabelColor: Colors.grey,
                      labelColor: AppTheme.greenPrimary,
                      indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
                      tabs: [
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _setState ? Colors.white : AppTheme.grey1
                          ),
                          child: const Center(child: Text("Posts"),
                        ),),
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: _setState ? AppTheme.grey1 : Colors.white
                          ),
                          child: const Center(child: Text("Photos"),
                        ),),
                      ],
                    ),
                  ),
                Expanded(
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                        Flexible(
                          child: ListView.builder(
                          itemCount: thePost.length,
                          controller: _scrollController,
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          reverse: true,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return Container(
                              height: 77,
                              child: Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(thePost[index].image),
                                      ),
                                      Positioned(
                                        left: 80,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(thePost[index].header, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                                Text(thePost[index].content, style: const TextStyle(fontSize: 12),overflow: TextOverflow.clip,),
                                              ],
                                            ),
                                          ))
                                    ],
                              ),
                            );
                          },
                          //children:  UnmodifiableListView(_messages),
                        ),),
                      // second tab bar viiew widget
                      Flexible(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 180,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: thePhoto.length,
                          controller: _scrollController,
                          padding: const EdgeInsets.only(top: 10),
                          reverse: true,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return Container(
                              padding: const EdgeInsets.all(20),
                              height: 140,
                              width: 140,
                              child: Stack(
                                children: [
                                  Image.asset(thePhoto[index].image, height: 120,),
                                  Positioned(
                                    top: 122,
                                    child: Text(thePhoto[index].header,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.clip,),
                                  )
                                ],
                              ),
                            );
                          },
                          //children:  UnmodifiableListView(_messages),
                        ),),
                    ],
                  ),
                ),
              ],
            )
        )));
  }
  List<UserPost> thePost = [
    UserPost(image: "assets/images/cat1.png",header: "Zuri", content: "A cute cat who likes to be close to everyone around him"),
    UserPost(image: "assets/images/cat2.png",header: "Pewter", content: "Mischievous, makes everyone laugh when around him"),
    UserPost(image: "assets/images/cat3.png",header: "Harper", content: "A gentle, docile cat"),
    UserPost(image: "assets/images/cat4.png",header: "Ophelia", content: "A sulky cat"),
    UserPost(image: "assets/images/cat5.png",header: "Quinn", content: "A cat who loves to cuddle"),
  ];
  List<UserPhoto> thePhoto = [
    UserPhoto(image: "assets/images/dog1.png",header: "Scooter"),
    UserPhoto(image: "assets/images/dog2.png",header: "Spike"),
    UserPhoto(image: "assets/images/dog3.png",header: "Boone and Jayden"),
    UserPhoto(image: "assets/images/dog4.png",header: "Enzo"),
    UserPhoto(image: "assets/images/dog5.png",header: "Hershey"),
  ];
}
class UserPost{ //component dor chat message demo
  String image;
  String header;
  String content;
  UserPost({required this.image,required this.header, required this.content});
}
class UserPhoto{ //component dor chat message demo
  String image;
  String header;
  UserPhoto({required this.image,required this.header});
}

