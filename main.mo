import Map "mo:base/HashMap";
import Text "mo:base/Text";

// asıl kodları buraya yazıyoruz
actor{
//type veri tipleri olusturduk
type Name = Text;
type Phone = Text ;

type Entry = {
desc: Text;
phone: Phone; 
};

type Message ={
receiver: Text;
mess : Text;
};
//değistirilemez bir veri oluşturma.
let phoneBook = Map.HashMap<Name , Entry>(0,Text.equal , Text.hash);

let MessageHistory = Map.HashMap<Phone,Message>(0,Text.equal , Text.hash);

public func insert (name : Name , entry:Entry): async()
{
  phoneBook.put(name , entry);
};

public func sendMessage(senderPhone : Phone , message : Message):async(){
  MessageHistory.put(senderPhone , message);
};

public func getPhone (name : Name):async ?Entry{
 return phoneBook.get(name);
};
//?
public query func getMessage (senderPhone:Phone): async ?Message{
  return MessageHistory.get(senderPhone);
};
}
