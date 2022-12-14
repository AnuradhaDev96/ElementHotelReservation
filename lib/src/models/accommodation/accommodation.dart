import 'package:cloud_firestore/cloud_firestore.dart';

class Accommodation {
  String? roomName, refBranch, description;
  int? noOfRooms, floorNo, size;
  int? tempReservedRoomCountForResultSet; // removed from db and only for view purpose
  DocumentReference? reference;
  String? id;
  double? rateInLkr;
  List<int>? roomNumbers;

  Accommodation({
    this.id,
    required this.roomName,
    required this.refBranch,
    required this.description,
    required this.noOfRooms,
    required this.floorNo,
    required this.size,
    required this.rateInLkr,
    this.tempReservedRoomCountForResultSet,
    this.reference,
    this.roomNumbers,
  });

  static final List<Accommodation> _systemRoomList = [
    Accommodation(
      floorNo: 3,
      size: 360,
      noOfRooms: 120,
      id: "R0001",
      description:
      "As the name implies, our presidential suite is the ultimate in luxury and our Bentota hotel’s most lavish room. Choose this suite for the perfect mix of luxury and residential-style features, such as a kitchenette, bar counter, dining room and lounge area, replete with all the amenities one could need for a truly pampered stay.",
      refBranch: "Unawatuna",
      roomName: "Presidential Suite",
      rateInLkr: 54000.00,
    ),
    Accommodation(
      floorNo: 1,
      size: 42,
      noOfRooms: 5,
      id: "R0002",
      description:
      "Our standard Citrus rooms are far from ‘basic’. The superior rooms offer a king sized bed and private balcony with an incredible sea view and many amenities to make your stay a delightful one. Each room provides stylish, contemporary accommodation with the Citrus flare, making it the ideal place for a fun vacation when looking for hotels near Bentota beaches.",
      refBranch: "Bentota",
      roomName: "Superior Room",
      rateInLkr: 44000.00,
    ),
    Accommodation(
      floorNo: 2,
      size: 67,
      noOfRooms: 5,
      id: "R0003",
      description:
      "Experience the next level of luxury at one of the best Kalutara beach hotels with our deluxe rooms. Including all the amenities featured in our superior room, deluxe rooms also come with a Jacuzzi bathtub for a truly indulgent vacation.",
      refBranch: "Bentota",
      roomName: "Deluxe Suite",
      rateInLkr: 43000.00,
    ),
  ];

  static List<Accommodation> get systemRoomList {
    if (_systemRoomList == null) {
      return <Accommodation>[];
    } else {
      return _systemRoomList;
    }
  }

  Accommodation.fromMap(Map<String, dynamic> map, {required this.reference}):
    floorNo = map["floorNo"],
    size = map["size"],
    noOfRooms = map["noOfRooms"],
    description = map["description"],
    refBranch = map["refBranch"],
    roomName = map["roomName"],
    rateInLkr = map["rateInLkr"],
    roomNumbers = map["roomNumbers"] == null ? null : List<int>.from(map["roomNumbers"]).map((e) => e).toList();

  Map<String, dynamic> toMap(){
    return {
      'floorNo': floorNo,
      'size': size,
      'noOfRooms': noOfRooms,
      'description': description,
      'refBranch': refBranch,
      'roomName': roomName,
      'rateInLkr': rateInLkr,
      'roomNumbers': roomNumbers,
    };
  }

  Accommodation.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

  Map<String, dynamic> toJson(){
    return {
      'floorNo': floorNo,
      'size': size,
      'noOfRooms': noOfRooms,
      'description': description,
      'refBranch': refBranch,
      'roomName': roomName,
      'rateInLkr': rateInLkr,
      'reference': reference,
      'roomNumbers': roomNumbers,
    };
  }
}