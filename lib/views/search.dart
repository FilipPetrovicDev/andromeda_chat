import 'package:andromeda_chat/services/database.dart';
import 'package:andromeda_chat/views/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  late QuerySnapshot snapshot;

  initiateSearch() {
    databaseMethods
     .getUserByUsername(searchTextEditingController.text)
     .then((val){
    setState(() {
     snapshot = val;
    });
  });
  }

  Widget searchList(){
    var snapshot;
    return snapshot != null ? ListView.builder(
      itemCount: snapshot.documents.length,
      shrinkWrap: true,
      itemBuilder: (context, index){
        var snapshot;
        return SearchTile(
          userName: snapshot.data.docs[index].data["name"],
          userEmail: snapshot.data.docs[index].data["email"],
        );
      }) : Container();
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextEditingController,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                        hintText: "search username",
                        hintStyle: TextStyle(
                          color: Colors.white54
                        ),
                        border: InputBorder.none,
                      )
                    )
                    ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0x36FFFFFF),
                            const Color(0x0FFFFFF),
                          ]
                        ),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      padding: EdgeInsets.all(10),
                      child: Image.asset("images/searchbuttonpng.png",)),
                  )
                ],
              ),
            ),
            searchList()
          ],
        ),
      )
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  const SearchTile({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(userName, style: simpleTextStyle(),),
              Text(userEmail, style: simpleTextStyle(),),
            ],
            ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Message"),
          )
        ],
      ),
    );
  }
}