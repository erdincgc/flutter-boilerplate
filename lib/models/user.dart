List<User> usersList = [
  User(1, 'Isa Tusa', 'isa.tusa@me.com'),
  User(2, 'Racquel Ricciardi', 'racquel.ricciardi@me.com'),
  User(3, 'Teresita Mccubbin', 'teresita.mccubbin@me.com'),
  User(4, 'Rhoda Hassinger', 'rhoda.hassinger@me.com'),
  User(5, 'Carson Cupps', 'carson.cupps@me.com'),
  User(6, 'Devora Nantz', 'devora.nantz@me.com'),
];

class User {
  final int _id;

  final String _name;

  final String _username;

  final String _password;

  User(int id, String name, String password, [String username])
      : _id = id,
        _name = name,
        _password = password,
        _username = username;

/*  User.map(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._username = obj["username"];
    this._password = obj["password"];
  }*/

  int get id => _id;

  String get name => _name;

  String get username => _username;

  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["name"] = _name;
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

  User getUserDetailSimulate(int userId) {
    return usersList[userId];
  }
}
