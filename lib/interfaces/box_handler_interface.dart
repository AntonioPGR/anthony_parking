import 'package:hive/hive.dart';

abstract class BoxHandlerInterface<Key, Model>{

  Box<Model> getBox();

  Model? getUniqueById(Key key){
    return getBox().get(key);
  }

  List<Model> getAll(){
    return [...getBox().values];
  }

  void add(Key key, Model model){
    getBox().put(key, model);
  }

  void update(Key key, Model model){
    getBox().put(key, model);
  }

  void delete(Key key){
    getBox().delete(key);
  }

}
