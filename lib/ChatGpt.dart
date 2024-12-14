import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getGPTFeedback(List<double> voltages) async {
  const String apiKey =
      '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'; // Replace with your API key

  // Create the prompt for GPT
  final String prompt =
      'Analyze the following voltage values per second and provide feedback: ${voltages.join(", ")}';

  // Define the API request URL and headers
  final Uri url = Uri.parse('https://api.openai.com/v1/completions');
  final Map<String, String> headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  // Define the request body
  final Map<String, dynamic> body = {
    'model': 'text-davinci-003', // Model for the GPT response
    'prompt': prompt,
    'max_tokens': 100, // Limit the number of tokens in the response
    'temperature': 0.7, // Adjust creativity level of the response
  };

  try {
    // Make the POST request to the OpenAI API
    final http.Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    // Check for a successful response
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['choices'][0]['text'].trim(); // Return the GPT response text
    } else {
      return 'Error: ${response.statusCode} - ${response.reasonPhrase}';
    }
  } catch (error) {
    // Handle exceptions during the API call
    return 'Failed to fetch feedback: $error';
  }
}
