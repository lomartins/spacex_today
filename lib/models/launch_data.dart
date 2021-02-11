class LaunchData {
  Fairings fairings;
  Links links;
  dynamic staticFireDateUtc;
  dynamic staticFireDateUnix;
  bool tbd;
  bool net;
  int window;
  String rocket;
  bool success;
  String details;
  List<dynamic> crew;
  List<String> ships;
  List<dynamic> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  dynamic launchLibraryId;
  List<dynamic> failures;
  int flightNumber;
  String name;
  String dateUtc;
  int dateUnix;
  String dateLocal;
  String datePrecision;
  bool upcoming;
  List<Cores> cores;
  String id;

  LaunchData({
      this.fairings, 
      this.links, 
      this.staticFireDateUtc, 
      this.staticFireDateUnix, 
      this.tbd, 
      this.net, 
      this.window, 
      this.rocket, 
      this.success, 
      this.details, 
      this.crew, 
      this.ships, 
      this.capsules, 
      this.payloads, 
      this.launchpad, 
      this.autoUpdate, 
      this.launchLibraryId, 
      this.failures, 
      this.flightNumber, 
      this.name, 
      this.dateUtc, 
      this.dateUnix, 
      this.dateLocal, 
      this.datePrecision, 
      this.upcoming, 
      this.cores, 
      this.id});

  LaunchData.fromJson(dynamic json) {
    fairings = json["fairings"] != null ? Fairings.fromJson(json["fairings"]) : null;
    links = json["links"] != null ? Links.fromJson(json["links"]) : null;
    staticFireDateUtc = json["static_fire_date_utc"];
    staticFireDateUnix = json["static_fire_date_unix"];
    tbd = json["tbd"];
    net = json["net"];
    window = json["window"];
    rocket = json["rocket"];
    success = json["success"];
    details = json["details"] != null ? json["details"] : "";
    crew = json["crew"] != null ? json["crew"] : [];
    ships = json["ships"] != null ? json["ships"].cast<String>() : [];
    capsules = json["capsules"] != null ? json["capsules"].cast<String>() : [];
    payloads = json["payloads"] != null ? json["payloads"].cast<String>() : [];
    launchpad = json["launchpad"];
    autoUpdate = json["auto_update"];
    launchLibraryId = json["launch_library_id"];
    failures = json["failures"] != null ? json["failures"] : [];
    flightNumber = json["flight_number"];
    name = json["name"] != null ? json["name"] : "";
    dateUtc = json["date_utc"];
    dateUnix = json["date_unix"];
    dateLocal = json["date_local"];
    datePrecision = json["date_precision"];
    upcoming = json["upcoming"];
    if (json["cores"] != null) {
      cores = [];
      json["cores"].forEach((v) {
        cores.add(Cores.fromJson(v));
      });
    }
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (fairings != null) {
      map["fairings"] = fairings.toJson();
    }
    if (links != null) {
      map["links"] = links.toJson();
    }
    map["static_fire_date_utc"] = staticFireDateUtc;
    map["static_fire_date_unix"] = staticFireDateUnix;
    map["tbd"] = tbd;
    map["net"] = net;
    map["window"] = window;
    map["rocket"] = rocket;
    map["success"] = success;
    map["details"] = details;
    if (crew != null) {
      map["crew"] = crew.map((v) => v.toJson()).toList();
    }
    map["ships"] = ships;
    if (capsules != null) {
      map["capsules"] = capsules.map((v) => v.toJson()).toList();
    }
    map["payloads"] = payloads;
    map["launchpad"] = launchpad;
    map["auto_update"] = autoUpdate;
    map["launch_library_id"] = launchLibraryId;
    if (failures != null) {
      map["failures"] = failures.map((v) => v.toJson()).toList();
    }
    map["flight_number"] = flightNumber;
    map["name"] = name;
    map["date_utc"] = dateUtc;
    map["date_unix"] = dateUnix;
    map["date_local"] = dateLocal;
    map["date_precision"] = datePrecision;
    map["upcoming"] = upcoming;
    if (cores != null) {
      map["cores"] = cores.map((v) => v.toJson()).toList();
    }
    map["id"] = id;
    return map;
  }

}

class Cores {
  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  bool landingSuccess;
  String landingType;
  String landpad;

  Cores({
      this.core, 
      this.flight, 
      this.gridfins, 
      this.legs, 
      this.reused, 
      this.landingAttempt, 
      this.landingSuccess, 
      this.landingType, 
      this.landpad});

  Cores.fromJson(dynamic json) {
    core = json["core"];
    flight = json["flight"];
    gridfins = json["gridfins"];
    legs = json["legs"];
    reused = json["reused"];
    landingAttempt = json["landing_attempt"];
    landingSuccess = json["landing_success"];
    landingType = json["landing_type"];
    landpad = json["landpad"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["core"] = core;
    map["flight"] = flight;
    map["gridfins"] = gridfins;
    map["legs"] = legs;
    map["reused"] = reused;
    map["landing_attempt"] = landingAttempt;
    map["landing_success"] = landingSuccess;
    map["landing_type"] = landingType;
    map["landpad"] = landpad;
    return map;
  }

}

class Links {
  Patch patch;
  Reddit reddit;
  Flickr flickr;
  dynamic presskit;
  String webcast;
  String youtubeId;
  String article;
  dynamic wikipedia;

  Links({
      this.patch, 
      this.reddit, 
      this.flickr, 
      this.presskit, 
      this.webcast, 
      this.youtubeId, 
      this.article, 
      this.wikipedia});

  Links.fromJson(dynamic json) {
    patch = json["patch"] != null ? Patch.fromJson(json["patch"]) : null;
    reddit = json["reddit"] != null ? Reddit.fromJson(json["reddit"]) : null;
    flickr = json["flickr"] != null ? Flickr.fromJson(json["flickr"]) : null;
    presskit = json["presskit"];
    webcast = json["webcast"];
    youtubeId = json["youtube_id"];
    article = json["article"];
    wikipedia = json["wikipedia"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (patch != null) {
      map["patch"] = patch.toJson();
    }
    if (reddit != null) {
      map["reddit"] = reddit.toJson();
    }
    if (flickr != null) {
      map["flickr"] = flickr.toJson();
    }
    map["presskit"] = presskit;
    map["webcast"] = webcast;
    map["youtube_id"] = youtubeId;
    map["article"] = article;
    map["wikipedia"] = wikipedia;
    return map;
  }

}

class Flickr {
  List<dynamic> small;
  List<String> original;

  Flickr({
      this.small, 
      this.original});

  Flickr.fromJson(dynamic json) {
    small = json["small"] != null ? json["small"] : [];
    original = json["original"] != null ? json["original"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (small != null) {
      map["small"] = small.map((v) => v.toJson()).toList();
    }
    map["original"] = original;
    return map;
  }

}

class Reddit {
  String campaign;
  String launch;
  dynamic media;
  String recovery;

  Reddit({
      this.campaign, 
      this.launch, 
      this.media, 
      this.recovery});

  Reddit.fromJson(dynamic json) {
    campaign = json["campaign"];
    launch = json["launch"];
    media = json["media"];
    recovery = json["recovery"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["campaign"] = campaign;
    map["launch"] = launch;
    map["media"] = media;
    map["recovery"] = recovery;
    return map;
  }

}

class Patch {
  String small;
  String large;

  Patch({
      this.small, 
      this.large});

  Patch.fromJson(dynamic json) {
    small = json["small"];
    large = json["large"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["small"] = small;
    map["large"] = large;
    return map;
  }

}

class Fairings {
  bool reused;
  bool recoveryAttempt;
  bool recovered;
  List<String> ships;

  Fairings({
      this.reused, 
      this.recoveryAttempt, 
      this.recovered, 
      this.ships});

  Fairings.fromJson(dynamic json) {
    reused = json["reused"];
    recoveryAttempt = json["recovery_attempt"];
    recovered = json["recovered"];
    ships = json["ships"] != null ? json["ships"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["reused"] = reused;
    map["recovery_attempt"] = recoveryAttempt;
    map["recovered"] = recovered;
    map["ships"] = ships;
    return map;
  }

}