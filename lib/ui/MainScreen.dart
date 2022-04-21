import 'package:flutter/material.dart';
import 'package:imdb_movie_app/network/models/MovieResponseModel.dart';
import 'package:imdb_movie_app/network/models/MovieModel.dart';

import 'package:provider/provider.dart';

import 'package:imdb_movie_app/network/Api_Service.dart';

import 'DetailPage.dart';
import 'custom_ui/MovieGridCardView.dart';
import 'package:imdb_movie_app/util/SortType.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final _crossSearchController1 = TextEditingController();
  FocusNode focusNode = FocusNode();
  var inputText = "";
  List<MovieModel> tempList = [];
  bool order = false;
  MovieResponseModel? _responseModel;

  var sortType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 4,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                  child: Text("IMDB Movie App")),
              curve: Curves.fastLinearToSlowEaseIn,
            ),
            const SizedBox(height: 15),
            Container(
                margin: const EdgeInsets.only(left: 90, right: 90),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sortType = SortType.ACC;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Ascending"))),
            const SizedBox(height: 55),
            Container(
                margin: const EdgeInsets.only(left: 90, right: 90),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sortType = SortType.DESC;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Descending"))),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                  focusNode: focusNode,
                  autofocus: false,
                  cursorColor: Colors.black,
                  controller: _crossSearchController1,
                  textInputAction: TextInputAction.search,
                  onChanged: (val) {
                    setState(() {
                      inputText = val;
                    });
                  },
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          color: Colors.black,
                          onPressed: () {
                            focusNode.requestFocus();
                          }),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      suffixIcon: hidingIcon(),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Color(passwordColor)),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.black))))),
          const SizedBox(height: 5),
          _listFutureTask(context),
        ],
      ),
    );
  }

  Widget? hidingIcon() {
    //for search textField
    if (inputText.length > 0) {
      return IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          //splashColor: Colors.redAccent,
          onPressed: () {
            setState(() {
              _crossSearchController1.clear();
              inputText = "";
            });
          });
    } else {
      return null;
    }
  }

  FutureBuilder _listFutureTask(BuildContext context) {
    return FutureBuilder<MovieResponseModel>(
        future:
        Provider.of<ApiService>(context, listen: false).getMovieBySearch(inputText),
        builder:
            (BuildContext context, AsyncSnapshot<MovieResponseModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Please Enter Movie Name"),
              );
            }
            _responseModel = snapshot.data!;
            if(sortType!=null && sortType == SortType.ACC){
              _assending();
            }else if (sortType!=null && sortType == SortType.DESC){
             _desending();
            }
            return _listTasks(context: context, tasks: _responseModel!.Search);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  _assending() async {
    setState(() {
      _responseModel!.Search.sort((a, b) => a.Year.toString().compareTo(b.Year.toString()));
    });


  }
  _desending() async {
    setState(() {
      _responseModel!.Search.sort((a, b) => b.Year.toString().compareTo(a.Year.toString()));
    });

  }
  Expanded _listTasks({required BuildContext context, required List<MovieModel> tasks}) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 8, right: 8),
        itemCount: tasks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {

              movieDetailInfo(
                context,
                tasks[index].imdbID
              );
            },
            child: movieGridCard(
                tasks[index].Poster, tasks[index].Title, tasks[index].Year),
          );
        },
      ),
    );
  }
}