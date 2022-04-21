import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

movieGridCard(String poster, String title, String year) {
  return Card(
    // color: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 8.0,
    child: Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        // color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              poster,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
              cacheWidth: 100,
              cacheHeight: 100,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.normal,overflow: TextOverflow.ellipsis,
              ),maxLines: null,
            ),
          ),

          Text(year,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              )),
        ],
      ),
    ),
  );
}