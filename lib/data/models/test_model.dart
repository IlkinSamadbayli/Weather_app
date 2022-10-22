class TestData {
  Users? users;
  dynamic requests;

  TestData({users, requests});

  TestData.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    if (json['requests'] != null) {
      if (requests is List) {
        requests = [];
      } else if (requests is Requests) {
        requests = Requests.fromJson(json['requests']);
      }
    } else {
      requests = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.toJson();
    }
    if (requests != null) {
      data['requests'] = requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;

  Users({id, name});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Requests {
  int? requestId;

  Requests({id, name});

  Requests.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['request_id'] = requestId;
    return data;
  }
}
