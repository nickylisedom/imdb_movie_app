import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb_movie_app/network/constants.dart';
import 'package:imdb_movie_app/network/models/MovieModel.dart';
import 'package:provider/provider.dart';

import '../network/Api_Service.dart';

import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


movieDetailInfo(BuildContext context,id) {
   launchURL(url) async{
     if (!await launch(url)) throw 'Could not launch $url';
  }
  return showDialog(
      context: context,
      builder: (context) {
        return
          FutureBuilder<MovieModel>(
            future:  Provider.of<ApiService>(context, listen: false).getMovieById( id,'full'),
            builder:  (BuildContext context, AsyncSnapshot<MovieModel> snapshot) {

              if (snapshot.connectionState == ConnectionState.done) {

                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Please Enter Movie Name"),
                  );
                }
                return Center(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color:Colors.white,
                      ),
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: snapshot.data!.Poster==null?Text("no Image"): Image.network(
                                snapshot.data!.Poster,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            RichText(text: TextSpan(
                                text: "Title: ",
                                style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(text: snapshot.data!.Title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,)
                                  ),
                                ]
                            )),

                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                const Text("Year: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(snapshot.data!.Year,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ))
                              ],
                            ),
                            const  SizedBox(height: 5,),
                            Row(
                              children: [
                                const Text("ImdbId: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(snapshot.data!.imdbID,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                const Text("Type: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(snapshot.data!.Type,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Web Link: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                InkWell(
                                  onTap: () {

                                    String _url = imdbWebView + snapshot.data!.imdbID+'/';
                                    launchURL(_url);

                                  },
                                  child: Text(imdbWebView + snapshot.data!.imdbID+'/',
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                          fontSize: 15,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.italic
                                      )),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Description: ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(snapshot.data!.Plot,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );

      });


}

