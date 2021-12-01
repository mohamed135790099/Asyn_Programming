class MyInt extends Iterable<String>{
  final List<String>li2;
  MyInt(this.li2);

  @override
  // TODO: implement iterator
  Iterator<String> get iterator =>li2.iterator;
}

void main(){
  final myLi2=MyInt(['ONE','TWO','THREE','FOUR','FIVE']);
  for(final i in myLi2){
    print(i);
  }
  var l=myLi2.map((e) => e.length);
  for(final item in l){
    print(item);
  }
}