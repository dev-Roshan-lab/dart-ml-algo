void main() {
  List x_test = [2, 4, 6, 8, 11];//test dataset
  List y_tar = [1, 2, 3, 4, 6];//target dataset
  
  double m = 0;
  int smallest = 0;
  
  find_coords(List test) {//supposed to find the line that passes through most number of coords
    List values = [];
    for (int i = 0; i < x_test.length-1; i++) {
      int difference = test[i] - x_test[i+1];
      values.add(difference);
    }
    print(values);
    values.forEach((e) => {
      if (e < smallest) {smallest = values.indexOf(e)}
    });
    print(smallest);
  }
  
  void slope_fn(int x1, int y1, double m, int x) {
    double y = m*(x - x1) + y1;
    print(y);
  }
  
  void predict(List l1, List l2, int x) async {
    await find_coords(l1);
    int x1 = x_test[smallest];
    int x2 = x_test[smallest+1];
    int y1 = y_tar[smallest];
    int y2 = y_tar[smallest+1];
    
    int change_in_x = num.parse((x1 - x2).toString().replaceAll('-',''));
    int change_in_y = num.parse((y1 - y2).toString().replaceAll('-',''));
    m = change_in_y / change_in_x;
    print(m);
    slope_fn(x1, y1, m, x);
  }
  predict(x_test, y_tar, 23);//3'rd input variable is the new entry of x_test for which we find the target y
}
