class SpacexMod{
  final String patch;
  final String name;
  final String details;

  SpacexMod({
    this.patch,
    this.name,
    this.details
  });

  factory SpacexMod.fromJson(Map<String, dynamic> json){
    if (json == null ){
      return null;
    }
    return new SpacexMod(
        patch: json["links"]["patch"]["small"],
        name: json["name"],
        details: json["details"]
    );
  }

}