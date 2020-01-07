
_JSON_Parse:

;MyProject.c,19 :: 		char* JSON_Parse(char* jsonPtr,char* key, char* value)
;MyProject.c,21 :: 		char* ptr1=memchr(jsonPtr, '\"', 3);
	MOVF        FARG_JSON_Parse_jsonPtr+0, 0 
	MOVWF       FARG_memchr_p+0 
	MOVF        FARG_JSON_Parse_jsonPtr+1, 0 
	MOVWF       FARG_memchr_p+1 
	MOVLW       34
	MOVWF       FARG_memchr_n+0 
	MOVLW       3
	MOVWF       FARG_memchr_v+0 
	MOVLW       0
	MOVWF       FARG_memchr_v+1 
	CALL        _memchr+0, 0
	MOVF        R0, 0 
	MOVWF       JSON_Parse_ptr1_L0+0 
	MOVF        R1, 0 
	MOVWF       JSON_Parse_ptr1_L0+1 
;MyProject.c,22 :: 		jsonPtr=memchr(ptr1+1, '\"', 20);
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FARG_memchr_p+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_memchr_p+1 
	MOVLW       34
	MOVWF       FARG_memchr_n+0 
	MOVLW       20
	MOVWF       FARG_memchr_v+0 
	MOVLW       0
	MOVWF       FARG_memchr_v+1 
	CALL        _memchr+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+0 
	MOVF        R1, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+1 
;MyProject.c,23 :: 		strncpy(key, ptr1+1, (unsigned)(jsonPtr-ptr1-1));
	MOVF        FARG_JSON_Parse_key+0, 0 
	MOVWF       FARG_strncpy_to+0 
	MOVF        FARG_JSON_Parse_key+1, 0 
	MOVWF       FARG_strncpy_to+1 
	MOVLW       1
	ADDWF       JSON_Parse_ptr1_L0+0, 0 
	MOVWF       FARG_strncpy_from+0 
	MOVLW       0
	ADDWFC      JSON_Parse_ptr1_L0+1, 0 
	MOVWF       FARG_strncpy_from+1 
	MOVF        JSON_Parse_ptr1_L0+0, 0 
	SUBWF       R0, 0 
	MOVWF       FARG_strncpy_size+0 
	MOVF        JSON_Parse_ptr1_L0+1, 0 
	SUBWFB      R1, 0 
	MOVWF       FARG_strncpy_size+1 
	MOVLW       1
	SUBWF       FARG_strncpy_size+0, 1 
	MOVLW       0
	SUBWFB      FARG_strncpy_size+1, 1 
	CALL        _strncpy+0, 0
;MyProject.c,25 :: 		ptr1=memchr(jsonPtr+1, '\"', 3);
	MOVLW       1
	ADDWF       FARG_JSON_Parse_jsonPtr+0, 0 
	MOVWF       FARG_memchr_p+0 
	MOVLW       0
	ADDWFC      FARG_JSON_Parse_jsonPtr+1, 0 
	MOVWF       FARG_memchr_p+1 
	MOVLW       34
	MOVWF       FARG_memchr_n+0 
	MOVLW       3
	MOVWF       FARG_memchr_v+0 
	MOVLW       0
	MOVWF       FARG_memchr_v+1 
	CALL        _memchr+0, 0
	MOVF        R0, 0 
	MOVWF       JSON_Parse_ptr1_L0+0 
	MOVF        R1, 0 
	MOVWF       JSON_Parse_ptr1_L0+1 
;MyProject.c,26 :: 		jsonPtr=memchr(ptr1+1, '\"', 20);
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FARG_memchr_p+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_memchr_p+1 
	MOVLW       34
	MOVWF       FARG_memchr_n+0 
	MOVLW       20
	MOVWF       FARG_memchr_v+0 
	MOVLW       0
	MOVWF       FARG_memchr_v+1 
	CALL        _memchr+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+0 
	MOVF        R1, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+1 
;MyProject.c,27 :: 		strncpy(value, ptr1+1, (unsigned)(jsonPtr-ptr1-1));
	MOVF        FARG_JSON_Parse_value+0, 0 
	MOVWF       FARG_strncpy_to+0 
	MOVF        FARG_JSON_Parse_value+1, 0 
	MOVWF       FARG_strncpy_to+1 
	MOVLW       1
	ADDWF       JSON_Parse_ptr1_L0+0, 0 
	MOVWF       FARG_strncpy_from+0 
	MOVLW       0
	ADDWFC      JSON_Parse_ptr1_L0+1, 0 
	MOVWF       FARG_strncpy_from+1 
	MOVF        JSON_Parse_ptr1_L0+0, 0 
	SUBWF       R0, 0 
	MOVWF       FARG_strncpy_size+0 
	MOVF        JSON_Parse_ptr1_L0+1, 0 
	SUBWFB      R1, 0 
	MOVWF       FARG_strncpy_size+1 
	MOVLW       1
	SUBWF       FARG_strncpy_size+0, 1 
	MOVLW       0
	SUBWFB      FARG_strncpy_size+1, 1 
	CALL        _strncpy+0, 0
;MyProject.c,28 :: 		return jsonPtr;
	MOVF        FARG_JSON_Parse_jsonPtr+0, 0 
	MOVWF       R0 
	MOVF        FARG_JSON_Parse_jsonPtr+1, 0 
	MOVWF       R1 
;MyProject.c,29 :: 		}
L_end_JSON_Parse:
	RETURN      0
; end of _JSON_Parse

_main:

;MyProject.c,31 :: 		void main()
;MyProject.c,34 :: 		unsigned char lcdClear=1;
	MOVLW       1
	MOVWF       main_lcdClear_L0+0 
;MyProject.c,35 :: 		uart1_init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,36 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,37 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;MyProject.c,39 :: 		while (1) {
L_main1:
;MyProject.c,41 :: 		if (UART1_Data_Ready() == 1) {          // if data is received
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;MyProject.c,42 :: 		UART1_Read_Text(myData, "OK", 85);    // reads text until 'OK' is found
	MOVLW       _myData+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_myData+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       85
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;MyProject.c,44 :: 		if(myData!=0x00)
	CLRF        R1 
	CLRF        R2 
	MOVLW       hi_addr(_myData+0)
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVF        R1, 0 
	XORLW       _myData+0
L__main12:
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;MyProject.c,46 :: 		ptr2=myData;
	MOVLW       _myData+0
	MOVWF       main_ptr2_L0+0 
	MOVLW       hi_addr(_myData+0)
	MOVWF       main_ptr2_L0+1 
;MyProject.c,47 :: 		ptr2 = JSON_Parse(ptr2,name1,value1);
	MOVF        main_ptr2_L0+0, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+0 
	MOVF        main_ptr2_L0+1, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+1 
	MOVLW       _name1+0
	MOVWF       FARG_JSON_Parse_key+0 
	MOVLW       hi_addr(_name1+0)
	MOVWF       FARG_JSON_Parse_key+1 
	MOVLW       _value1+0
	MOVWF       FARG_JSON_Parse_value+0 
	MOVLW       hi_addr(_value1+0)
	MOVWF       FARG_JSON_Parse_value+1 
	CALL        _JSON_Parse+0, 0
	MOVF        R0, 0 
	MOVWF       main_ptr2_L0+0 
	MOVF        R1, 0 
	MOVWF       main_ptr2_L0+1 
;MyProject.c,48 :: 		ptr2= JSON_Parse(ptr2+1,name2,value2);
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+1 
	MOVLW       _name2+0
	MOVWF       FARG_JSON_Parse_key+0 
	MOVLW       hi_addr(_name2+0)
	MOVWF       FARG_JSON_Parse_key+1 
	MOVLW       _value2+0
	MOVWF       FARG_JSON_Parse_value+0 
	MOVLW       hi_addr(_value2+0)
	MOVWF       FARG_JSON_Parse_value+1 
	CALL        _JSON_Parse+0, 0
	MOVF        R0, 0 
	MOVWF       main_ptr2_L0+0 
	MOVF        R1, 0 
	MOVWF       main_ptr2_L0+1 
;MyProject.c,49 :: 		JSON_Parse(ptr2+1,name3,value3);
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_JSON_Parse_jsonPtr+1 
	MOVLW       _name3+0
	MOVWF       FARG_JSON_Parse_key+0 
	MOVLW       hi_addr(_name3+0)
	MOVWF       FARG_JSON_Parse_key+1 
	MOVLW       _value3+0
	MOVWF       FARG_JSON_Parse_value+0 
	MOVLW       hi_addr(_value3+0)
	MOVWF       FARG_JSON_Parse_value+1 
	CALL        _JSON_Parse+0, 0
;MyProject.c,50 :: 		if(lcdClear)
	MOVF        main_lcdClear_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;MyProject.c,52 :: 		if(strcmp(name1,"SSID")==0 && strcmp(name2,"IP")==0)
	MOVLW       _name1+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_name1+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVLW       0
	XORWF       R0, 0 
L__main13:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
	MOVLW       _name2+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_name2+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       0
	XORWF       R0, 0 
L__main14:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main9:
;MyProject.c,53 :: 		{  lcdClear=0;}
	CLRF        main_lcdClear_L0+0 
L_main8:
;MyProject.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,55 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,56 :: 		Lcd_Out(1,1,name1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _name1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_name1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,57 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;MyProject.c,58 :: 		Lcd_Out_Cp(value1);
	MOVLW       _value1+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_value1+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;MyProject.c,59 :: 		Lcd_Out(2,1,name2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _name2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_name2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,60 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;MyProject.c,61 :: 		Lcd_Out_Cp(value2);
	MOVLW       _value2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_value2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;MyProject.c,62 :: 		}
L_main5:
;MyProject.c,63 :: 		Lcd_Out(3,1,name3);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _name3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_name3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,64 :: 		Lcd_Chr_Cp(':');
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;MyProject.c,65 :: 		Lcd_Out_Cp(value3);
	MOVLW       _value3+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_value3+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;MyProject.c,66 :: 		strcpy(myData,"");
	MOVLW       _myData+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_myData+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;MyProject.c,67 :: 		UART1_Read();UART1_Read();
	CALL        _UART1_Read+0, 0
	CALL        _UART1_Read+0, 0
;MyProject.c,68 :: 		}
L_main4:
;MyProject.c,69 :: 		}
L_main3:
;MyProject.c,70 :: 		}
	GOTO        L_main1
;MyProject.c,71 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
