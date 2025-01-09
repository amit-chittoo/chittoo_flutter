import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Firebasecalls
{
  late DatabaseReference learningDb;
  late DatabaseReference userDB;
  late DatabaseReference userDetailsDB;
  late DatabaseReference topicStateDB;
  late DatabaseReference coursesDB;
  late DatabaseReference suggestedDB;
  FirebaseApp app = Firebase.app();

  void setDbs()
  {
    learningDb = FirebaseDatabase.instanceFor(app: app ,databaseURL: "https://chittoo-masternew.asia-southeast1.firebasedatabase.app/").ref("Learningexercise");
    //userDB = FirebaseDatabase.getInstance("https://chittoo-usermaster.asia-southeast1.firebasedatabase.app/").getReference("Newusers");
    userDB = FirebaseDatabase.instanceFor(app: app ,databaseURL:"https://chittoo-usermain.firebaseio.com/").ref("Newusers");
    userDetailsDB = FirebaseDatabase.instanceFor(app: app ,databaseURL:"https://chittoo-f17e7-2f55c.firebaseio.com/").ref("Userdetails");

    topicStateDB = FirebaseDatabase.instance.ref("usertopicstate");
    suggestedDB = FirebaseDatabase.instanceFor(app: app ,databaseURL:"https://chittoo-suggested.asia-southeast1.firebasedatabase.app/").ref("usersuggestevalues");
    coursesDB = FirebaseDatabase.instanceFor(app: app ,databaseURL:"https://chittoo-usermaster.asia-southeast1.firebasedatabase.app/").ref("courses");
  }
}