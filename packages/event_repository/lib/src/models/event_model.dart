/// id : 3736
/// title : "Hot Event 1"
/// description : "gg"
/// spots : 0
/// price : 0
/// lat : 25.118216115205882
/// lon : 55.53834155201912
/// placeName : "new - Dubai - United Arab Emirates"
/// featuredImage : "IMG_20220917_215409-65de2f6d-1663685295553.jpg"
/// deeplink : "https://meetntrain.page.link/bSz9"
/// date : "2022-10-31T20:00:00.000Z"
/// tagId : 14
/// createdBy : 9124
/// communityId : 164
/// whatsapp_link : null
/// images : [{"url":"IMG_20220917_215409-65de2f6d-1663685295553.jpg"}]
/// finish_date : "2022-10-31T21:00:00.000Z"
/// location_id : 2
/// cancelled_at : null
/// is_private : false
/// lockedAt : null
/// minimumMembers : null
/// paymentMethod : "CASH"
/// receiveUpdates : false
/// state : "created"
/// isCheckedIn : false
/// isFeatured : true
/// viewersCount : 13
/// community : {"id":164,"title":"John's community","image":"f7282c33-1645530494168","bio":"community gamed gdn ","points":3,"rating_count":1,"connection_count":3,"event_count":22,"profile_picture":"f51db13e-1645530494084","deeplink":null,"link_expiry":null,"state":"verified"}
/// users : [{"id":8357,"first_name":"Ibrahim","last_name":"Salah","email":"ibrahimsalah006@gmail.com","bio":"","profile_picture":"fd6d7917-1635395043864","points":0,"mobile":"1019093332","country_code":"+20","is_verified":true,"isTrusted":true},{"id":9125,"first_name":"John","last_name":"Samy","email":"johnsamyg@gmail.com","bio":null,"profile_picture":"efd4976d-1645531096730","points":0,"mobile":"1010970751","country_code":"+20","is_verified":true,"isTrusted":true}]
/// tag : {"id":14,"title":"Swim","icon":"swim_icon.png"}
/// isWaiting : false
/// isJoined : true
/// joinedUsersCount : 2
/// checkedInCount : 0
/// paidAmount : 0
/// ownerEarnings : 0
///
class EventsModel {
  EventsModel({
    List<EventModel> events = const [],
  }) {
    _events = events;
  }

  EventsModel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      _events = json.map((v) => EventModel.fromJson(v)).toList();
    }
  }

  List<EventModel> _events = [];

  addToList({
    List<EventModel> events = const [],
  }) =>
      _events.addAll(events);

  List<EventModel> get events => _events;

  List<Map<String, dynamic>>? toJson() {
    if (_events.isNotEmpty) {
      return _events.map((v) => v.toJson()).toList();
    }
    return [];
  }
}

class EventModel {
  EventModel({
    int? id,
    String? title,
    String? description,
    int? spots,
    int? price,
    double? lat,
    double? lon,
    String? placeName,
    String? featuredImage,
    String? deeplink,
    String? date,
    int? tagId,
    int? createdBy,
    int? communityId,
    dynamic whatsappLink,
    List<Images>? images,
    String? finishDate,
    int? locationId,
    dynamic cancelledAt,
    bool? isPrivate,
    dynamic lockedAt,
    dynamic minimumMembers,
    String? paymentMethod,
    bool? receiveUpdates,
    String? state,
    bool? isCheckedIn,
    bool? isFeatured,
    int? viewersCount,
    Community? community,
    List<Users>? users,
    Tag? tag,
    bool? isWaiting,
    bool? isJoined,
    int? joinedUsersCount,
    int? checkedInCount,
    int? paidAmount,
    int? ownerEarnings,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _spots = spots;
    _price = price;
    _lat = lat;
    _lon = lon;
    _placeName = placeName;
    _featuredImage = featuredImage;
    _deeplink = deeplink;
    _date = date;
    _tagId = tagId;
    _createdBy = createdBy;
    _communityId = communityId;
    _whatsappLink = whatsappLink;
    _images = images;
    _finishDate = finishDate;
    _locationId = locationId;
    _cancelledAt = cancelledAt;
    _isPrivate = isPrivate;
    _lockedAt = lockedAt;
    _minimumMembers = minimumMembers;
    _paymentMethod = paymentMethod;
    _receiveUpdates = receiveUpdates;
    _state = state;
    _isCheckedIn = isCheckedIn;
    _isFeatured = isFeatured;
    _viewersCount = viewersCount;
    _community = community;
    _users = users;
    _tag = tag;
    _isWaiting = isWaiting;
    _isJoined = isJoined;
    _joinedUsersCount = joinedUsersCount;
    _checkedInCount = checkedInCount;
    _paidAmount = paidAmount;
    _ownerEarnings = ownerEarnings;
  }

  EventModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _spots = json['spots'];
    _price = json['price'];
    _lat = json['lat'];
    _lon = json['lon'];
    _placeName = json['placeName'];
    _featuredImage = json['featuredImage'];
    _deeplink = json['deeplink'];
    _date = json['date'];
    _tagId = json['tagId'];
    _createdBy = json['createdBy'];
    _communityId = json['communityId'];
    _whatsappLink = json['whatsapp_link'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _finishDate = json['finish_date'];
    _locationId = json['location_id'];
    _cancelledAt = json['cancelled_at'];
    _isPrivate = json['is_private'];
    _lockedAt = json['lockedAt'];
    _minimumMembers = json['minimumMembers'];
    _paymentMethod = json['paymentMethod'];
    _receiveUpdates = json['receiveUpdates'];
    _state = json['state'];
    _isCheckedIn = json['isCheckedIn'];
    _isFeatured = json['isFeatured'];
    _viewersCount = json['viewersCount'];
    _community = json['community'] != null
        ? Community.fromJson(json['community'])
        : null;
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
    _tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
    _isWaiting = json['isWaiting'];
    _isJoined = json['isJoined'];
    _joinedUsersCount = json['joinedUsersCount'];
    _checkedInCount = json['checkedInCount'];
    _paidAmount = json['paidAmount'];
    _ownerEarnings = json['ownerEarnings'];
  }

  int? _id;
  String? _title;
  String? _description;
  int? _spots;
  int? _price;
  double? _lat;
  double? _lon;
  String? _placeName;
  String? _featuredImage;
  String? _deeplink;
  String? _date;
  int? _tagId;
  int? _createdBy;
  int? _communityId;
  dynamic _whatsappLink;
  List<Images>? _images;
  String? _finishDate;
  int? _locationId;
  dynamic _cancelledAt;
  bool? _isPrivate;
  dynamic _lockedAt;
  dynamic _minimumMembers;
  String? _paymentMethod;
  bool? _receiveUpdates;
  String? _state;
  bool? _isCheckedIn;
  bool? _isFeatured;
  int? _viewersCount;
  Community? _community;
  List<Users>? _users;
  Tag? _tag;
  bool? _isWaiting;
  bool? _isJoined;
  int? _joinedUsersCount;
  int? _checkedInCount;
  int? _paidAmount;
  int? _ownerEarnings;

  EventModel copyWith({
    int? id,
    String? title,
    String? description,
    int? spots,
    int? price,
    double? lat,
    double? lon,
    String? placeName,
    String? featuredImage,
    String? deeplink,
    String? date,
    int? tagId,
    int? createdBy,
    int? communityId,
    dynamic whatsappLink,
    List<Images>? images,
    String? finishDate,
    int? locationId,
    dynamic cancelledAt,
    bool? isPrivate,
    dynamic lockedAt,
    dynamic minimumMembers,
    String? paymentMethod,
    bool? receiveUpdates,
    String? state,
    bool? isCheckedIn,
    bool? isFeatured,
    int? viewersCount,
    Community? community,
    List<Users>? users,
    Tag? tag,
    bool? isWaiting,
    bool? isJoined,
    int? joinedUsersCount,
    int? checkedInCount,
    int? paidAmount,
    int? ownerEarnings,
  }) =>
      EventModel(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        spots: spots ?? _spots,
        price: price ?? _price,
        lat: lat ?? _lat,
        lon: lon ?? _lon,
        placeName: placeName ?? _placeName,
        featuredImage: featuredImage ?? _featuredImage,
        deeplink: deeplink ?? _deeplink,
        date: date ?? _date,
        tagId: tagId ?? _tagId,
        createdBy: createdBy ?? _createdBy,
        communityId: communityId ?? _communityId,
        whatsappLink: whatsappLink ?? _whatsappLink,
        images: images ?? _images,
        finishDate: finishDate ?? _finishDate,
        locationId: locationId ?? _locationId,
        cancelledAt: cancelledAt ?? _cancelledAt,
        isPrivate: isPrivate ?? _isPrivate,
        lockedAt: lockedAt ?? _lockedAt,
        minimumMembers: minimumMembers ?? _minimumMembers,
        paymentMethod: paymentMethod ?? _paymentMethod,
        receiveUpdates: receiveUpdates ?? _receiveUpdates,
        state: state ?? _state,
        isCheckedIn: isCheckedIn ?? _isCheckedIn,
        isFeatured: isFeatured ?? _isFeatured,
        viewersCount: viewersCount ?? _viewersCount,
        community: community ?? _community,
        users: users ?? _users,
        tag: tag ?? _tag,
        isWaiting: isWaiting ?? _isWaiting,
        isJoined: isJoined ?? _isJoined,
        joinedUsersCount: joinedUsersCount ?? _joinedUsersCount,
        checkedInCount: checkedInCount ?? _checkedInCount,
        paidAmount: paidAmount ?? _paidAmount,
        ownerEarnings: ownerEarnings ?? _ownerEarnings,
      );

  int? get id => _id;

  String? get title => _title;

  String? get description => _description;

  int? get spots => _spots;

  int? get price => _price;

  double? get lat => _lat;

  double? get lon => _lon;

  String? get placeName => _placeName;

  String? get featuredImage => _featuredImage;

  String? get deeplink => _deeplink;

  String? get date => _date;

  int? get tagId => _tagId;

  int? get createdBy => _createdBy;

  int? get communityId => _communityId;

  dynamic get whatsappLink => _whatsappLink;

  List<Images>? get images => _images;

  String? get finishDate => _finishDate;

  int? get locationId => _locationId;

  dynamic get cancelledAt => _cancelledAt;

  bool? get isPrivate => _isPrivate;

  dynamic get lockedAt => _lockedAt;

  dynamic get minimumMembers => _minimumMembers;

  String? get paymentMethod => _paymentMethod;

  bool? get receiveUpdates => _receiveUpdates;

  String? get state => _state;

  bool? get isCheckedIn => _isCheckedIn;

  bool? get isFeatured => _isFeatured;

  int? get viewersCount => _viewersCount;

  Community? get community => _community;

  List<Users>? get users => _users;

  Tag? get tag => _tag;

  bool? get isWaiting => _isWaiting;

  bool? get isJoined => _isJoined;

  int? get joinedUsersCount => _joinedUsersCount;

  int? get checkedInCount => _checkedInCount;

  int? get paidAmount => _paidAmount;

  int? get ownerEarnings => _ownerEarnings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['spots'] = _spots;
    map['price'] = _price;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['placeName'] = _placeName;
    map['featuredImage'] = _featuredImage;
    map['deeplink'] = _deeplink;
    map['date'] = _date;
    map['tagId'] = _tagId;
    map['createdBy'] = _createdBy;
    map['communityId'] = _communityId;
    map['whatsapp_link'] = _whatsappLink;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['finish_date'] = _finishDate;
    map['location_id'] = _locationId;
    map['cancelled_at'] = _cancelledAt;
    map['is_private'] = _isPrivate;
    map['lockedAt'] = _lockedAt;
    map['minimumMembers'] = _minimumMembers;
    map['paymentMethod'] = _paymentMethod;
    map['receiveUpdates'] = _receiveUpdates;
    map['state'] = _state;
    map['isCheckedIn'] = _isCheckedIn;
    map['isFeatured'] = _isFeatured;
    map['viewersCount'] = _viewersCount;
    if (_community != null) {
      map['community'] = _community?.toJson();
    }
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    if (_tag != null) {
      map['tag'] = _tag?.toJson();
    }
    map['isWaiting'] = _isWaiting;
    map['isJoined'] = _isJoined;
    map['joinedUsersCount'] = _joinedUsersCount;
    map['checkedInCount'] = _checkedInCount;
    map['paidAmount'] = _paidAmount;
    map['ownerEarnings'] = _ownerEarnings;
    return map;
  }
}

/// id : 14
/// title : "Swim"
/// icon : "swim_icon.png"

class Tag {
  Tag({
    int? id,
    String? title,
    String? icon,
  }) {
    _id = id;
    _title = title;
    _icon = icon;
  }

  Tag.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _icon = json['icon'];
  }

  int? _id;
  String? _title;
  String? _icon;

  Tag copyWith({
    int? id,
    String? title,
    String? icon,
  }) =>
      Tag(
        id: id ?? _id,
        title: title ?? _title,
        icon: icon ?? _icon,
      );

  int? get id => _id;

  String? get title => _title;

  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['icon'] = _icon;
    return map;
  }
}

/// id : 8357
/// first_name : "Ibrahim"
/// last_name : "Salah"
/// email : "ibrahimsalah006@gmail.com"
/// bio : ""
/// profile_picture : "fd6d7917-1635395043864"
/// points : 0
/// mobile : "1019093332"
/// country_code : "+20"
/// is_verified : true
/// isTrusted : true

class Users {
  Users({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? bio,
    String? profilePicture,
    int? points,
    String? mobile,
    String? countryCode,
    bool? isVerified,
    bool? isTrusted,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _bio = bio;
    _profilePicture = profilePicture;
    _points = points;
    _mobile = mobile;
    _countryCode = countryCode;
    _isVerified = isVerified;
    _isTrusted = isTrusted;
  }

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _bio = json['bio'];
    _profilePicture = json['profile_picture'];
    _points = json['points'];
    _mobile = json['mobile'];
    _countryCode = json['country_code'];
    _isVerified = json['is_verified'];
    _isTrusted = json['isTrusted'];
  }

  int? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _bio;
  String? _profilePicture;
  int? _points;
  String? _mobile;
  String? _countryCode;
  bool? _isVerified;
  bool? _isTrusted;

  Users copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? bio,
    String? profilePicture,
    int? points,
    String? mobile,
    String? countryCode,
    bool? isVerified,
    bool? isTrusted,
  }) =>
      Users(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        bio: bio ?? _bio,
        profilePicture: profilePicture ?? _profilePicture,
        points: points ?? _points,
        mobile: mobile ?? _mobile,
        countryCode: countryCode ?? _countryCode,
        isVerified: isVerified ?? _isVerified,
        isTrusted: isTrusted ?? _isTrusted,
      );

  int? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get bio => _bio;

  String? get profilePicture => _profilePicture;

  int? get points => _points;

  String? get mobile => _mobile;

  String? get countryCode => _countryCode;

  bool? get isVerified => _isVerified;

  bool? get isTrusted => _isTrusted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['bio'] = _bio;
    map['profile_picture'] = _profilePicture;
    map['points'] = _points;
    map['mobile'] = _mobile;
    map['country_code'] = _countryCode;
    map['is_verified'] = _isVerified;
    map['isTrusted'] = _isTrusted;
    return map;
  }
}

/// id : 164
/// title : "John's community"
/// image : "f7282c33-1645530494168"
/// bio : "community gamed gdn "
/// points : 3
/// rating_count : 1
/// connection_count : 3
/// event_count : 22
/// profile_picture : "f51db13e-1645530494084"
/// deeplink : null
/// link_expiry : null
/// state : "verified"

class Community {
  Community({
    int? id,
    String? title,
    String? image,
    String? bio,
    int? points,
    int? ratingCount,
    int? connectionCount,
    int? eventCount,
    String? profilePicture,
    dynamic deeplink,
    dynamic linkExpiry,
    String? state,
  }) {
    _id = id;
    _title = title;
    _image = image;
    _bio = bio;
    _points = points;
    _ratingCount = ratingCount;
    _connectionCount = connectionCount;
    _eventCount = eventCount;
    _profilePicture = profilePicture;
    _deeplink = deeplink;
    _linkExpiry = linkExpiry;
    _state = state;
  }

  Community.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _bio = json['bio'];
    _points = json['points'];
    _ratingCount = json['rating_count'];
    _connectionCount = json['connection_count'];
    _eventCount = json['event_count'];
    _profilePicture = json['profile_picture'];
    _deeplink = json['deeplink'];
    _linkExpiry = json['link_expiry'];
    _state = json['state'];
  }

  int? _id;
  String? _title;
  String? _image;
  String? _bio;
  int? _points;
  int? _ratingCount;
  int? _connectionCount;
  int? _eventCount;
  String? _profilePicture;
  dynamic _deeplink;
  dynamic _linkExpiry;
  String? _state;

  Community copyWith({
    int? id,
    String? title,
    String? image,
    String? bio,
    int? points,
    int? ratingCount,
    int? connectionCount,
    int? eventCount,
    String? profilePicture,
    dynamic deeplink,
    dynamic linkExpiry,
    String? state,
  }) =>
      Community(
        id: id ?? _id,
        title: title ?? _title,
        image: image ?? _image,
        bio: bio ?? _bio,
        points: points ?? _points,
        ratingCount: ratingCount ?? _ratingCount,
        connectionCount: connectionCount ?? _connectionCount,
        eventCount: eventCount ?? _eventCount,
        profilePicture: profilePicture ?? _profilePicture,
        deeplink: deeplink ?? _deeplink,
        linkExpiry: linkExpiry ?? _linkExpiry,
        state: state ?? _state,
      );

  int? get id => _id;

  String? get title => _title;

  String? get image => _image;

  String? get bio => _bio;

  int? get points => _points;

  int? get ratingCount => _ratingCount;

  int? get connectionCount => _connectionCount;

  int? get eventCount => _eventCount;

  String? get profilePicture => _profilePicture;

  dynamic get deeplink => _deeplink;

  dynamic get linkExpiry => _linkExpiry;

  String? get state => _state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['bio'] = _bio;
    map['points'] = _points;
    map['rating_count'] = _ratingCount;
    map['connection_count'] = _connectionCount;
    map['event_count'] = _eventCount;
    map['profile_picture'] = _profilePicture;
    map['deeplink'] = _deeplink;
    map['link_expiry'] = _linkExpiry;
    map['state'] = _state;
    return map;
  }
}

/// url : "IMG_20220917_215409-65de2f6d-1663685295553.jpg"

class Images {
  Images({
    String? url,
  }) {
    _url = url;
  }

  Images.fromJson(dynamic json) {
    _url = json['url'];
  }

  String? _url;

  Images copyWith({
    String? url,
  }) =>
      Images(
        url: url ?? _url,
      );

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }
}
