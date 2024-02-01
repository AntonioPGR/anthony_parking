import 'package:hive/hive.dart';

abstract class BoxHandler<Key, Model>{

  late Box<Model> box;

  Model? getUniqueById(Key key);

  List<Model> getAll();

  void add(Model model);

  void update(Key key, Model model);

  void delete(Key key);
}