class Group {
  int? id;
  String? groupname;
  String? adminno;
  String? type;

  Group({this.id, this.groupname, this.adminno, this.type});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupname = json['groupname'];
    adminno = json['adminno'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupname'] = this.groupname;
    data['adminno'] = this.adminno;
    data['type'] = this.type;
    return data;
  }
}