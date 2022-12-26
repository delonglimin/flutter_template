// ignore_for_file: public_member_api_docs, sort_constructors_first
 typedef OnItemSelected<T> = void Function(T item); 
void  main(List<String> args) {
 test<String> aa = test('aaa',fun: (String item) { print(item); });
 aa.say();
 print(aa.runtimeType);

}

class test<T> {
  final OnItemSelected<T> fun;
  final T item;
  test(this.item, {
    required this.fun,
  });
  void say(){
    fun(item);
  }
}
