/*
List li=[2,5,8,3,2];
class ListIterator extends Iterator<int>{
  ListIterator(this.list);
  List list=[];
  int _current=0;
  int index=0;

  @override
  int get current =>_current;

  @override
  bool moveNext() {
    if(index==list.length){
      _current=404;
      return false;
    }
    else{
      _current=list[index++];
      return true;
    }
  }
}
void main(){
  var i=ListIterator(li);
  i.moveNext();
  i.moveNext();

  print(i.current);


}
 */
/*
Iterable<int>getRange(int start ,int end)sync*{
  if(start<end){
    yield start;
    for(var i in getRange(start+1, end)){
      yield i;
    }
  }

}
void main(){
  final Iterable<int> numbers=getRange(1, 12).where((element) => element%2==1);
  numbers.forEach((element) {print(element);});
}
 */

Future<int>fetchDouble(int val){
  return Future.value(val*2);
}
Stream<int>fetchDoubles(int start,int end) async*{
  if(start<=end){
    yield start;
    yield* fetchDoubles(start+1, end);
  }
}
void main(){
  fetchDoubles(1,10).listen((event) {print(event);});
}



