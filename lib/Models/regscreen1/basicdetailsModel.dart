
class Reg1Data{
  final Basicinfo binfo;
  final Address hAddress;

  Reg1Data({required this.binfo, required this.hAddress});
}



class Basicinfo{
  final String HospitalName;
  final String email;
  final String liscenceNumber;

  Basicinfo({required this.HospitalName, required this.email, required this.liscenceNumber});
}


class Address{
  final String addressLine1;
  final String zip;
  final String country;
  final String state;
  final String city;

  Address(this.city, {required this.addressLine1, required this.zip, required this.country, required this.state});
}