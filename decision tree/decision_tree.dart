gini_index(var groups, var classes) {
  num n = 0;
  var content_count = [];
  var gini = 0.0;
  //find n
  for (int i = 0; i < groups.length; i++) {
    content_count.add((groups[i]).length);
    print(content_count);
    var size = (groups[i]).length;
  }
  content_count.forEach((var e) {
    n += e;
  });
  //calculate gini
  var size = 0.0;
  getLastElement(var list) {
    List output = [];
    list.forEach((List e) {
      output.add(e[e.length]);
    });
    return output;
  }

  countAndCalc(var data, var to_count) {}

  groups.forEach((e) {
    size = e.length;
    if (size != 0) {
      var score = 0;
      classes.forEach((e) {
        var p = getLastElement(groups)//count the number of e in getLastElement(groups)/size;
      });
    }
  });
  return gini;
}
