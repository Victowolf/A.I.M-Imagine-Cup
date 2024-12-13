// Define the pin for ECG input
const int ECG_PIN = 34;  // ADC1_6 on ESP32

void setup() {
  // Initialize serial communication
  Serial.begin(115200);
  // Set ECG_PIN as an input
  pinMode(ECG_PIN, INPUT);
}

void loop() {
  // Read the ECG signal
  int ecgValue = analogRead(ECG_PIN);
  
  // Print the ECG value to the Serial Monitor
  Serial.println(ecgValue);
  
  // Add a small delay
  delay(10);  // Adjust delay for your sampling rate
}
