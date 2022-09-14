// import 'package:flutter/widgets.dart';

// void main(List<String> args) {
//   var i = Item(title: "xd");
//   print(i.title == "xd");
// }

// class List {
//   static String? title;
//   bool? done;
//   Widget? xd;

//   List({this.title, this.xd});
// }

// var item = Item(title: "", done: true);
void main(List<String> args) {
  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: 'int'}; // Use is and collection if.
  const set = {if (list is List<int>) ...list};
  print(i);
  print('$list \n $map\n$set');
}
