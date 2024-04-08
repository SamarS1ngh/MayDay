import 'package:fluttemp/ViewModel/someClass_VM/someclass.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => SomeChangenotifierClass()),
  ];
}
