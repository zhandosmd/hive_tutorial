import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  Future<Box<User>>? userBox;

  void setup(){
    if(!Hive.isAdapterRegistered(0)){     // not register in main, because user maybe wont use
      Hive.registerAdapter(UserAdapter());
    }
    userBox = Hive.openBox<User>('user_box');
    userBox?.then((box){
      box.listenable().addListener(() {    // help us to know that box changed
        print(box.length);                 // we can connect it with inherited notifier
      });
    });
  }
  void doSome() async{
    // Hive.deleteBoxFromDisk('testBox');     to delete box from hive

    final box = await userBox;
    final user = User('Dos', 20);
    box?.add(user);
    // var box = await Hive.openBox<User>('testBox');
    // final user = User('Zhandos', 20, 'Tom');
    // await box.put('dos', user);
    // final userFromBox = box.get('dos');
    // print(box.get('dos'));
    // user.name = 'Nurtas';
    // user.save();
    // print(box.getAt(box.length-1));
    // print(box.values);
    // print(userFromBox);
    // await box.compact();
    // await box.close();

  }
}
// typeAdapter - by default we can store primitive types,List, map, datetime.
// if we want store our object(class) we should use typeAdapter
@HiveType(typeId : 0)
class User { //extends HiveObject      // can save() delete()
  // @HiveField(2)
  // String? surname;    // we can add new field, can rename fields, delete fields
                      // BUT do not change hiveField number!!!
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;

  // @HiveField(3)
  // String? children;   // if we delete hiveField number 2, we cannot use it again to other fields

  User(this.name, this.age);
  @override
  String toString() => "Name: $name, Age: $age";
}

// can be generated
// class UserAdapter extends TypeAdapter<User> {
//   @override
//   final typeId = 0;    // different id for different classes
//
//   @override
//   User read(BinaryReader reader) {
//     final name = reader.readString();    // order is important
//     final age = reader.readInt();        // after stored objexcts do not change
//     return User(name, age);
//   }
//
//   @override
//   void write(BinaryWriter writer, User obj) {
//     writer.writeString(obj.name);
//     writer.writeInt(obj.age);
//   }
// }