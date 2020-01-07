#include <ArduinoJson.h>
#include <NTPClient.h>
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>         //https://github.com/tzapu/WiFiManager

StaticJsonDocument<200> JSON_Packet;

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP,"europe.pool.ntp.org", 18000);//18000 sec (5h) UTC offset for Pakistan

void setup(){
  WiFiManager wifiManager;
  wifiManager.autoConnect("AutoConnectAP");
  JSON_Packet["SSID"]=WiFi.SSID();
  JSON_Packet["IP"]=WiFi.localIP().toString();
  timeClient.begin();
  Serial.begin(9600);
  delay(10);
}

void loop() {
  timeClient.update();
  JSON_Packet["SSID"]=WiFi.SSID();
  JSON_Packet["IP"]=WiFi.localIP().toString();
  JSON_Packet["Time"]=timeClient.getFormattedTime();
  serializeJson(JSON_Packet, Serial);
  Serial.print("OK.");
  JSON_Packet.clear();
  delay(1000);
}
