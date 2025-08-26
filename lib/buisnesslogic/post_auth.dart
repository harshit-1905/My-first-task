
import 'package:http/http.dart' as http;
 //Future function for post request and error handling statuscodes
  Future<String> postDataAuth(String username, String password) async {
   final posturl='https://api.escuelajs.co/api/v1/auth/login';
   final Uri url=Uri.parse(posturl).replace(
                    queryParameters: {
                   "email":username,
                   "password": password, },
                  );
  try {
    final response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 201) {
      return 'success';
    } else if(response.statusCode == 401) {
      return "Invalid credentials, please try again.";
    }
    else if(response.statusCode==403)
    {
       return 'Valid authentication but insufficient permissions';
    }
    else if(response.statusCode==403)
    {
      return 'Malformed request body or headers, Please try again';
    }
    return 'unknown statuscode';
  } catch (e) {
    return 'unkown error please try relogin';
  }
}