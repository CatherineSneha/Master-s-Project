#include "Adafruit_PM25AQI.h"
#include <WiFiNINA.h>
#include "ThingSpeak.h"

#include <ArduinoBLE.h>

#include <Arduino_HTS221.h>


#include "utility/wifi_drv.h"

#define BLE_UUID_NETWORK_CONFIG_SERVICE              "343D2964-5ECF-2297-4463-609011571F24"
#define BLE_UUID_NETWORK_ENABLE_CHARACTERISTIC       "767B22E7-EA6C-B017-286A-55B68310FD9D"

long previousMillis = 0;
int interval = 0;
int ledState = LOW;

const int loadSize = 15;         // max payload size for BLE
char load[loadSize] = "";

//BLEService ledService("180A"); // BLE LED

// BLE LED Switch Characteristic - custom 128-bit UUID, read and writable by central
BLEByteCharacteristic switchCharacteristic("2A57", BLERead | BLEWrite);


BLEService networkConfigService( BLE_UUID_NETWORK_CONFIG_SERVICE );
BLECharacteristic networkEnableCharacteristic( BLE_UUID_NETWORK_ENABLE_CHARACTERISTIC , BLERead | BLENotify , loadSize + 1);


Adafruit_PM25AQI aqi = Adafruit_PM25AQI();

int sensorValue;

//const char * ssid = "SKY3CB4B";    //  your network SSID (name)
//const char * pass = "XYDNXBPCMS";   // your network password

const char * ssid = "VM8739088";    //  your network SSID (name)
const char * pass = "x524870!";   // your network password

int keyIndex = 0;            // your network key Index number (needed only for WEP)

WiFiClient  client;

bool networkInitialized = false;
bool bleModeFlag = false;

unsigned long myChannelNumber = 1802514;
const char * myWriteAPIKey = "7ORCT79IQ81GV518";

unsigned long myChannelNumber1 = 1803338;
const char * myWriteAPIKey1 = "0K1FGOLHNGW1QM5O";

unsigned long myChannelNumber2 = 1826222;
const char * myWriteAPIKey2 = "WGP4MP4PMPHEHQOC";

const char * myReadAPIKey = "RL1GY768ENBXG36T";

void setup() {
  // Wait for serial monitor to open
  Serial.begin(115200);
  while (!Serial) delay(10);
  //pinMode(A0, INPUT);
  // set built in LED pin to output mode
  pinMode(LED_BUILTIN, OUTPUT);
  String fv = WiFi.firmwareVersion();
  if (fv != "1.0.0") {
    Serial.println("Please upgrade the firmware");
  }
  ThingSpeak.begin(client);  //Initialize ThingSpeak

  Serial.println("Adafruit PMSA003I Air Quality Sensor");

  // Wait one second for sensor to boot up!
  delay(1000);

  Serial1.begin(9600);

  if (! aqi.begin_UART(&Serial1)) { // connect to the sensor over hardware serial
    Serial.println("Could not find PM 2.5 sensor!");
    while (1) delay(10);
  }
}

void loop() {

  if ( !networkInitialized )
  {
    if ( !bleModeFlag )
    {
      Serial.println( "Switch to WiFi: " );
      if ( !wifi() ) {
        Serial.println( "Failed" );
      }
      else {
        networkInitialized = true;
        Serial.println( "Success" );
      }
    }
    else {
      Serial.println( "Switch to BLE: " );
      delay(3000);
      if ( !ble() )
      {
        Serial.println( "Failed" );
      }
      else
      {
        networkInitialized = true;
        Serial.println( "Success" );
      }
    }
  }
  else
  {
    if ( !bleModeFlag )
    {
      connectWifi();
    }
    else
    {
      connectBLE();
    }
  }

}

void connectWifi() {
  int time = 0;
  Serial.println("Connecting to Wi-Fi");
  
  // Connect or reconnect to WiFi
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("Attempting to connect to SSID: ");
    Serial.println(ssid);
    while (WiFi.status() != WL_CONNECTED) {
      time++;
      if (time > 7) {
        // wait 1 second to print again
        networkInitialized = false;
        bleModeFlag = true;
        Serial.println( "WiFi connection failed" );
        return;
      }
      WiFi.begin(ssid, pass); // Connect to WPA/WPA2 network.
      Serial.print(".");
      delay(2000);
      if( WiFi.status() != WL_CONNECTED )
      {
        delay( 1000 );
      }
    }

  }
  Serial.println("\nConnected.");

  readSensor();

}

void connectBLE() {
  Serial.println("Connecting to BLE");

  delay(7000);

  BLEDevice central = BLE.central();

  if ( central )
  {
    Serial.print( "Connected to central: " );
    Serial.println( central.address() );

//   networkEnableCharacteristic.writeValue((const char*) load, strlen(load));   // set the initial value for the characeristic
//   networkConfigService.addCharacteristic(networkEnableCharacteristic);    // add the characteristic to the service

  
    while ( central.connected() )
    {
      if ( networkEnableCharacteristic.written() )
      {
        networkInitialized = false;
        bleModeFlag = false;
        return;
      } else {
        long aqiVal = readSensorBLE();
        String category;
        //Air Quality Index
        if (aqiVal >= 0 && aqiVal <= 50) {
          category = "Good";
          Serial.println(category);
          digitalWrite(LED_BUILTIN, HIGH);         // will turn the LED on
          delay(1000);
          digitalWrite(LED_BUILTIN, LOW);         // will turn the LED off
          delay(1000);
          digitalWrite(LED_BUILTIN, HIGH);      // will turn the LED on
          delay(1000);
          digitalWrite(LED_BUILTIN, LOW);
        } else if (aqiVal > 50 && aqiVal <= 100) {
          category = "Moderate";
          Serial.println(category);
          Serial.println("LED slow blink");
          digitalWrite(LED_BUILTIN, HIGH);         // will turn the LED on
          delay(1000);
          digitalWrite(LED_BUILTIN, LOW);         // will turn the LED off
          delay(1000);
          digitalWrite(LED_BUILTIN, HIGH);      // will turn the LED on
          delay(1000);
          digitalWrite(LED_BUILTIN, LOW);       // will turn the LED off
          break;
        } else if (aqiVal > 100 && aqiVal <= 150) {
          category = "USG";
          Serial.println(category);
          digitalWrite(LED_BUILTIN, HIGH);         // will turn the LED on
          delay(1000);
          digitalWrite(LED_BUILTIN, LOW);         // will turn the LED off
          delay(1000);
          digitalWrite(LED_BUILTIN, HIGH);      // will turn the LED on
          delay(1000);
          digitalWrite(LED_BUILTIN, LOW);       // will turn the LED off
          break;
        } else if (aqiVal > 150 && aqiVal <= 200) {
          category = "Unhealthy";
          Serial.println(category);
          digitalWrite(LED_BUILTIN, HIGH);         // will turn the LED on
          delay(500);
          digitalWrite(LED_BUILTIN, LOW);         // will turn the LED off
          delay(500);
          digitalWrite(LED_BUILTIN, HIGH);      // will turn the LED on
          delay(500);
          digitalWrite(LED_BUILTIN, LOW);       // will turn the LED off
        } else if (aqiVal > 200 && aqiVal <= 300) {
          category = "Very Unhealthy";
          Serial.println(category);
          digitalWrite(LED_BUILTIN, HIGH);         // will turn the LED on
          delay(500);
          digitalWrite(LED_BUILTIN, LOW);         // will turn the LED off
          delay(500);
          digitalWrite(LED_BUILTIN, HIGH);      // will turn the LED on
          delay(500);
          digitalWrite(LED_BUILTIN, LOW);       // will turn the LED off
        } else {
          category = "Hazardous";
          Serial.println(category);
          digitalWrite(LED_BUILTIN, HIGH);         // will turn the LED on
          delay(500);
          digitalWrite(LED_BUILTIN, LOW);         // will turn the LED off
          delay(500);
          digitalWrite(LED_BUILTIN, HIGH);      // will turn the LED on
          delay(500);
          digitalWrite(LED_BUILTIN, LOW);       // will turn the LED off
        }
      }
    }
    // when the central disconnects, print it out:
    Serial.print(F("Disconnected from central: "));
    Serial.println(central.address());
    digitalWrite(LED_BUILTIN, LOW);         // will turn the LED off
    networkInitialized = false;
    bleModeFlag = false;
    return;
    // wait 1 second to print again
    delay(1000);
  }
  networkInitialized = false;
  bleModeFlag = false;
  return;
}

bool wifi()
{
  Serial.println("Connecting to Wi-Fi");
  BLE.stopAdvertise();
  BLE.end();

  // Re-initialize the WiFi driver
  // This is currently necessary to switch from BLE to WiFi
  wiFiDrv.wifiDriverDeinit();
  wiFiDrv.wifiDriverInit();

  // check for the WiFi module availability:
  if (WiFi.status() == WL_NO_MODULE) {
    Serial.println("Communication with WiFi module failed!");
    return false;
    while (true);
  }

  return true;

}

bool ble()
{
  if ( !BLE.begin() )
  {
    return false;
  }

  // set advertised local name and service UUID:
  BLE.setDeviceName( "Nano 33 IoT" );
  BLE.setLocalName( "Nano 33 IoT" );
  BLE.setAdvertisedService( networkConfigService );

  networkEnableCharacteristic.writeValue((const char*) load, strlen(load));   // set the initial value for the characeristic
  networkConfigService.addCharacteristic(networkEnableCharacteristic);    // add the characteristic to the service


  // add the characteristic to the service
  networkConfigService.addCharacteristic( networkEnableCharacteristic );

  // add service
  BLE.addService( networkConfigService );

  // set the initial value for the characeristic:
  //networkEnableCharacteristic.writeValue( false );

  BLE.advertise();

  return true;

  Serial.println("BLE LED Peripheral");
  return true;
}

void readSensor() {

  PM25_AQI_Data data;

  if ( aqi.read(&data)) {
    Serial.println("Could not read from AQI");
    delay(500);  // try again in a bit!
    return;
  }
  Serial.println("AQI reading success");

  sensorValue = analogRead(0);       // read analog input pin 0
  Serial.println(F("---------------------------------------"));
  Serial.println(F("Concentration Units (standard)"));
  Serial.print("MQ135 Sensor  ");
  Serial.println(sensorValue);   
  Serial.print(sensorValue, DEC);               // prints the value read
  Serial.println(" PPM");
  delay(100);
  delay(1000);

  Serial.println();
  Serial.println(F("---------------------------------------"));
  Serial.println(F("Concentration Units (standard)"));
  Serial.println(F("---------------------------------------"));
  Serial.print(F("PM 1.0: ")); Serial.print(data.pm10_standard);
  Serial.print(F("\t\tPM 2.5: ")); Serial.print(data.pm25_standard);
  Serial.print(F("\t\tPM 10: ")); Serial.println(data.pm100_standard);
  Serial.println(F("Concentration Units (environmental)"));
  Serial.println(F("---------------------------------------"));
  Serial.print(F("PM 1.0: ")); Serial.print(data.pm10_env);
  Serial.print(F("\t\tPM 2.5: ")); Serial.print(data.pm25_env);
  Serial.print(F("\t\tPM 10: ")); Serial.println(data.pm100_env);
  Serial.println(F("---------------------------------------"));
  Serial.print(F("Particles > 0.3um / 0.1L air:")); Serial.println(data.particles_03um);
  Serial.print(F("Particles > 0.5um / 0.1L air:")); Serial.println(data.particles_05um);
  Serial.print(F("Particles > 1.0um / 0.1L air:")); Serial.println(data.particles_10um);
  Serial.print(F("Particles > 2.5um / 0.1L air:")); Serial.println(data.particles_25um);
  Serial.print(F("Particles > 5.0um / 0.1L air:")); Serial.println(data.particles_50um);
  Serial.print(F("Particles > 10 um / 0.1L air:")); Serial.println(data.particles_100um);
  Serial.println(F("---------------------------------------"));

  int x = ThingSpeak.writeField(myChannelNumber, 1, sensorValue, myWriteAPIKey);
  if (x == 200) {
    Serial.println("Channel update successful.");
  }
  else {
    Serial.println("Problem updating channel. HTTP error code " + String(x));
  }
  //delay(5000);
  int y = ThingSpeak.writeField(myChannelNumber1, 1, data.pm25_env, myWriteAPIKey1);
  if (y == 200) {
    Serial.println("Channel update successful.");
  }
  else {
    Serial.println("Problem updating channel. HTTP error code " + String(y));
  }

  //AQI Calculation
  long mqAQI = ((sensorValue/400)*100);
  Serial.println("MQ 135 AQI");
  Serial.println(mqAQI);
  long AQI = (((data.pm10_env + data.pm25_env + data.pm100_env) / (3 * 3600))+((sensorValue/400)*100))/2 ;
  Serial.print("AQI: "); Serial.println(AQI);
  int z = ThingSpeak.writeField(myChannelNumber2, 1, AQI , myWriteAPIKey2);
  if (z == 200) {
    Serial.println("Channel update successful.");
  }
  else {
    Serial.println("Problem updating channel. HTTP error code " + String(y));
  }
  long aqiVal = ThingSpeak.readLongField(myChannelNumber2, 1, myReadAPIKey);
  int statusCode = ThingSpeak.getLastReadStatus();
  //data = thingSpeakRead(myChannelNumber,Fields=[1],NumMinutes=5,OutputFormat='TimeTable')

  if (statusCode == 200)
  {
    Serial.print("AQI Value PM 2.5: ");
    Serial.println(aqiVal);
  }

  //Air Quality Index
  String category;
  //Air Quality Index
  if (aqiVal >= 0 && aqiVal <= 50) {
    category = "Good";
    Serial.println(category);
  } else if (aqiVal > 50 && aqiVal <= 100) {
    category = "Moderate";
    Serial.println(category);
  } else if (aqiVal > 100 && aqiVal <= 150) {
    category = "USG";
    Serial.println(category);
  } else if (aqiVal > 150 && aqiVal <= 200) {
    category = "Unhealthy";
    Serial.println(category);
  } else if (aqiVal > 200 && aqiVal <= 300) {
    category = "Very Unhealthy";
    Serial.println(category);
  } else {
    category = "Hazardous";
    Serial.println(category);
  }


  delay(15000);

}

long readSensorBLE() {
  PM25_AQI_Data data;

  if ( aqi.read(&data)) {
    Serial.println("Could not read from AQI");
    delay(500);  // try again in a bit!
  }
  Serial.println("AQI reading success");

  sensorValue = analogRead(0);       // read analog input pin 0
  Serial.println(F("---------------------------------------"));
  Serial.println(F("Concentration Units (standard)"));
  Serial.print("MQ135 Sensor  ");
  Serial.print(sensorValue, DEC);               // prints the value read
  Serial.println(" PPM");
  delay(100);
  delay(1000);

  Serial.println();
  Serial.println(F("---------------------------------------"));
  Serial.println(F("Concentration Units (standard)"));
  Serial.println(F("---------------------------------------"));
  Serial.print(F("PM 1.0: ")); Serial.print(data.pm10_standard);
  Serial.print(F("\t\tPM 2.5: ")); Serial.print(data.pm25_standard);
  Serial.print(F("\t\tPM 10: ")); Serial.println(data.pm100_standard);
  Serial.println(F("Concentration Units (environmental)"));
  Serial.println(F("---------------------------------------"));
  Serial.print(F("PM 1.0: ")); Serial.print(data.pm10_env);
  Serial.print(F("\t\tPM 2.5: ")); Serial.print(data.pm25_env);
  Serial.print(F("\t\tPM 10: ")); Serial.println(data.pm100_env);
  Serial.println(F("---------------------------------------"));
  Serial.print(F("Particles > 0.3um / 0.1L air:")); Serial.println(data.particles_03um);
  Serial.print(F("Particles > 0.5um / 0.1L air:")); Serial.println(data.particles_05um);
  Serial.print(F("Particles > 1.0um / 0.1L air:")); Serial.println(data.particles_10um);
  Serial.print(F("Particles > 2.5um / 0.1L air:")); Serial.println(data.particles_25um);
  Serial.print(F("Particles > 5.0um / 0.1L air:")); Serial.println(data.particles_50um);
  Serial.print(F("Particles > 10 um / 0.1L air:")); Serial.println(data.particles_100um);
  Serial.println(F("---------------------------------------"));

  long AQI = (data.pm10_env + data.pm25_env + data.pm100_env) / (3 * 3600) ;
  Serial.print("AQI: "); Serial.println(AQI);
  String category;
  //Air Quality Index
  if (AQI >= 0 && AQI <= 50) {
    category = "Good";
    Serial.println(category);
  } else if (AQI > 50 && AQI <= 100) {
    category = "Moderate";
    Serial.println(category);
  } else if (AQI > 100 && AQI <= 150) {
    category = "USG";
    Serial.println(category);
  } else if (AQI > 150 && AQI <= 200) {
    category = "Unhealthy";
    Serial.println(category);
  } else if (AQI > 200 && AQI <= 300) {
    category = "Very Unhealthy";
    Serial.println(category);
  } else {
    category = "Hazardous";
    Serial.println(category);
  }


  delay(15000);

  return AQI;
}
