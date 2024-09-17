String encodeUser(Map<String, dynamic> user) {
  return user.entries.map((e) => '${e.key}:${e.value}').join(',');
}

Map<String, dynamic> decodeUser(String userData) {
  return Map.fromEntries(userData.split(',').map((e) {
    final split = e.split(':');
    return MapEntry(split[0], split[1]);
  }));
}
