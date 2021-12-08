void main(){
//   Phone oppo = Phone('abcd2345');
//   oppo.use(); //. cascading operator
}

//keywords - class, implements, extends, override
abstract class Item{ 
  void use(){}
}

class Phone implements Item{
  final String imei;
  
  //constructor for class
  Phone(this.imei);
  
  @override
  void use(){
    print("Used to call other people");
  }
}

class Copy implements Item{
  final double price = 25;
  
  @override
  void use(){}
}

class ClassMateCopy extends Copy{
  @override
  final double price = 100;
}
