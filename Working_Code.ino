#include <WiFi.h> 
#include <WebServer.h> 
// Wi-Fi credentials 

const char* ssid = "Airtel-MyWiFi-AMF-311WW-6CAD"; 
const char* password = "38967f6a"; 

// Define a Boolean variable to track Wi-Fi connection status 

bool active = false; 

//asigns static ip. 
IPAddress staticIP(192, 168, 1, 200);      // Static IP you want to assign to ESP32 
IPAddress gateway(192, 168, 1, 1);         // Gateway (usually your router's IP) 
IPAddress subnet(255, 255, 255, 0);        // Subnet Mask (usually 255.255.255.0)
// Create an HTTP server instance 

WebServer server(80); 

// Endpoint handler for "/status" 

void handleStatusRequest() { 
  // Send CORS headers 
  server.sendHeader("Access-Control-Allow-Origin", "*"); 
  server.sendHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS"); 
  server.sendHeader("Access-Control-Allow-Headers", "*"); 
  // Send the value of active in JSON format 
  String jsonResponse = String("{\"active\":") + (active ? "true" : "false") + "}"; 
  server.send(200, "application/json", jsonResponse); 
} 

void setup() { 

  Serial.begin(115200); 
  // Start Wi-Fi connection 
   WiFi.config(staticIP, gateway, subnet); 
  WiFi.begin(ssid, password); 
  Serial.print("Connecting to WiFi"); 

  while (WiFi.status() != WL_CONNECTED) { 
    delay(500); 

    Serial.print("."); 
    active = false; // Update the active variable 
  } 
  active = true; // Update the active variable 
  Serial.println("\nConnected to WiFi"); 

  // Start the HTTP server 

  server.on("/status", handleStatusRequest); 
  server.begin(); 
  Serial.println("HTTP server started"); 
  Serial.println("\nConnected to WiFi"); 
  Serial.print("Static IP: "); 
  Serial.println(WiFi.localIP());  // Print the static IP address assigned to ESP32 
  Serial.println(WiFi.macAddress());

} 

void loop() { 
  // Handle incoming HTTP requests 
  server.handleClient(); 
} 