#line 1 "D:/mikroc json parser/mikroc_project/MyProject.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


char myData[90];
char name1[10], value1[20], name2[10], value2[20],name3[10], value3[20];

char* JSON_Parse(char* jsonPtr,char* key, char* value)
{
 char* ptr1=memchr(jsonPtr, '\"', 3);
 jsonPtr=memchr(ptr1+1, '\"', 20);
 strncpy(key, ptr1+1, (unsigned)(jsonPtr-ptr1-1));

 ptr1=memchr(jsonPtr+1, '\"', 3);
 jsonPtr=memchr(ptr1+1, '\"', 20);
 strncpy(value, ptr1+1, (unsigned)(jsonPtr-ptr1-1));
 return jsonPtr;
}

void main()
{
 char* ptr1,*ptr2;
 unsigned char lcdClear=1;
 uart1_init(9600);
 Lcd_Init();
 delay_ms(100);

 while (1) {

 if (UART1_Data_Ready() == 1) {
 UART1_Read_Text(myData, "OK", 85);

 if(myData!=0x00)
 {
 ptr2=myData;
 ptr2 = JSON_Parse(ptr2,name1,value1);
 ptr2= JSON_Parse(ptr2+1,name2,value2);
 JSON_Parse(ptr2+1,name3,value3);
 if(lcdClear)
 {
 if(strcmp(name1,"SSID")==0 && strcmp(name2,"IP")==0)
 { lcdClear=0;}
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,name1);
 Lcd_Chr_Cp(':');
 Lcd_Out_Cp(value1);
 Lcd_Out(2,1,name2);
 Lcd_Chr_Cp(':');
 Lcd_Out_Cp(value2);
 }
 Lcd_Out(3,1,name3);
 Lcd_Chr_Cp(':');
 Lcd_Out_Cp(value3);
 strcpy(myData,"");
 UART1_Read();UART1_Read();
 }
 }
 }
}
