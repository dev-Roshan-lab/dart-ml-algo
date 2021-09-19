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
    for (int i = 0; i < list.length; i++) {
      output.add(list[i][list[i].length - 1]);
    }
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

List test_split(var index, var value, var dataset) {
  var left = [];
  var right = [];
  for (var i = 0; i < dataset.length; i++) {
    var row = dataset[i];
    if (row[index] < value) {
      left.add(row);
    } else {
      right.add(row);
    }
  }
  return [left, right];
}

Map<String, dynamic> get_split(var dataset) {
  var class_values = [];
  for (var i = 0; i < dataset.length; i++) {
    var row_count = dataset[i].length;
    var dataset_class = dataset[i][row_count - 1];
    class_values.add(dataset_class);
  }
  var b_index, b_value, b_score = 999.0;
  var b_groups;
  for (var i = 0; i < (dataset[0].length) - 1; i++) {
    for (var x = 0; x < dataset.length; x++) {
      var groups = test_split(i, dataset[x][i], dataset);
      var gini = gini_index(groups, class_values);
      if (gini < b_score) {
        b_index = i;
        b_value = dataset[x][i];
        b_score = gini;
        b_groups = groups;
      }
    }
  }
  return {'index': b_index, 'value': b_value, 'groups': b_groups};
}
