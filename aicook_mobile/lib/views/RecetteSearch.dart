import 'package:aicook_mobile/components/recette/RecetteSearchResultsItem.dart';
import 'package:aicook_mobile/style/colors.dart';
import 'package:flutter/material.dart';

class RecetteSearch extends StatefulWidget {
  RecetteSearch({Key key}) : super(key: key);

  @override
  _RecetteSearchState createState() => _RecetteSearchState();
}

class _RecetteSearchState extends State<RecetteSearch> {
  final searchController = TextEditingController();
  FocusNode searchFocusNode;
  String searchInput = "";
  bool isTyping = true;

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
    searchController.addListener(() {
      searchInput = searchController.text;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          title: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  // width: 250,
                  padding: new EdgeInsets.all(4.0),
                  child: Card(
                    color: Color.fromARGB(100, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            isTyping = true;
                          });
                        },
                        onTap: () {
                          setState(() {
                            isTyping = false;
                          });
                        },
                        keyboardType: TextInputType.text,
                        focusNode: searchFocusNode,
                        controller: searchController,
                        autofocus: true,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.transparent)),
                          // suffix: IconButton(
                          //   onPressed: () {
                          //     searchController.clear();

                          //     setState(() {
                          //       isTyping = true;
                          //     });
                          //   },
                          //   icon: Icon(
                          //     Icons.clear,
                          //     color: Colors.black,
                          //   ),
                          // )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              isTyping
                  ? Container()
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        color: Colors.black,
                      ))
            ],
          ),
          backgroundColor: UsefulColors.bg,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              isTyping
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (BuildContext ctx, index) {
                        if (index.isOdd) return Divider();
                        String text = 'Suggestion numero ${index ~/ 2}';
                        return GestureDetector(
                          onTap: () {
                            searchController.text = text;
                            searchFocusNode.unfocus();
                            setState(() {
                              isTyping = false;
                            });
                          },
                          child: Hero(
                            tag: index,
                            child: Container(
                              padding: new EdgeInsets.all(10.0),
                              child: Text(text),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (BuildContext ctx, index) {
                        return RecetteSearchResultsItem(
                          index: index,
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
