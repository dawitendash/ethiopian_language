Map<String, Map<String, String>> getTranslationDictionary() {
  return {
    'english_amharic': {'hello': 'ሰላም', 'world': 'ዓለም', 'book': 'መጽሐፍ'},
    'amharic_english': {'ሰላም': 'hello', 'ዓለም': 'world', 'መጽሐፍ': 'book'},
    'english_oromifa': {'hello': 'akkam', 'world': 'amajjii'},
    'oromifa_english': {'akkam': 'hello', 'amajjii': 'world'},
    'english_tigrinya': {'hello': 'ሰላም', 'world': 'ዓለም'},
    'tigrinya_english': {'ሰላም': 'hello', 'ዓለም': 'world'},
    // Add more language pairs as needed
  };
}
