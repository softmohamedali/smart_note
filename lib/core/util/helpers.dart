import 'dart:convert';

List? convert(String input) {
  List output;
  try {
    output = json.decode(input);
    return output;
  } catch (err) {
    print('The input is not a string representation of a list');
    return null;
  }
}