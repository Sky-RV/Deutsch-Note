class Notebook_Model {

  final String Notebook_ID;
  final String Notebook_Name;

  Notebook_Model({required this.Notebook_ID, required this.Notebook_Name});

  Map<String, dynamic> toMap() {
    return {
      'Notebook_ID': Notebook_ID,
      'Notebook_Name': Notebook_Name,
    };
  }

  @override
  String toString() {
    return 'Notebook{Notebook_ID: $Notebook_ID, Notebook_Name: $Notebook_Name}';
  }
}