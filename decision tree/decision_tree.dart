double gini_index(var groups, var classes) {
  num n = 0.0;
  var content_count = [];

  //find n
  for (var i = 0; i < groups.length; i++) {
    content_count.add((groups[i]).length);
  }
  content_count.forEach((var e) {
    n += e;
  });

  //calculate gini
  var gini = 0.0;
  var size = 0.0;
  List getLastElement(var list) {
    var output = [];
    list.forEach((List e) {
      output.add(e[e.length - 1]);
    });
    return output;
  }

  double countAndCalc(var data, var to_count) {
    var count = 0.0;
    data.forEach((e) {
      if (e == to_count) {
        count++;
      }
    });
    return count;
  }

  for (int y = 0; y < groups.length; y++) {
    size = groups[y].length.toDouble();
    if (size != 0.0) {
      var score = 0.0;
      classes.forEach((e) {
        var p = countAndCalc(getLastElement(groups[y]), e) / size;
        score += (p * p);
      });
      gini += (1.0 - score) * (size / n);
    }
  }
  return gini;
}

test_split(var index, var value, var dataset) {
  var left, right = [];
  for (int i = 0; i < dataset.length; i++) {
    var row = dataset[i];
    if (row[index] < value) {
      left.add(row);
    } else {
      right.add(row);
    }
  }
  return [left, right];
}
