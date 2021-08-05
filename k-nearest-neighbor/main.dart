import 'algorithms/knn.dart';

void main(List<String> arguments) async {
  //Minimal dataset from Iris-dataset
  var dataset = [
    [5.1, 3.5, 1.4, 0.2, 0],
    [4.9, 3.0, 1.4, 0.2, 0],
    [4.7, 3.2, 1.3, 0.2, 0],
    [4.8, 3.1, 1.6, 0.2, 0],
    [6.6, 2.9, 4.6, 1.3, 1],
    [5.2, 2.7, 3.9, 1.4, 1],
    [5.6, 3.0, 4.5, 1.5, 1],
    [5.8, 2.7, 4.1, 1.0, 1],
    [7.7, 3.8, 6.7, 2.2, 2],
    [5.6, 2.8, 4.9, 2.0, 2],
    [6.1, 3.0, 4.9, 1.8, 2],
    [7.9, 3.8, 6.4, 2.0, 2]
  ];
  var prediction = predictKnn(dataset, dataset[0], 5);
  print(prediction);
}
