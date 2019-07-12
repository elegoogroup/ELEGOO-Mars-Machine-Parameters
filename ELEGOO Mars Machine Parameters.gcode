M8513           ; delete all parameters
;¡¾¡¾After the semicolon is a comment, please modify the corresponding parameters according to the comment, the command after the semicolon will be ignored¡¿¡¿
;The basic format is Mxxx Ixxx, Mxxx Txxx or Mxxx Sxxx, where Ixx (which is the letter I, the first letter of the integer, not the number 1) followed by an integer, which can be either ;decimal or hexadecimal (starting with 0x) ), followed by Sxx is a floating point number
;

;
¡¾Stepper motor direction control¡¿ The direction of I1 and I-1 is just the opposite, so if the motor direction is wrong, either change the wiring or change the direction parameter.
M8004 I-1       ; Z stepper motor direction


;¡¾XYZ axis extrusion head/platform movement configuration¡¿only affects the actual movement direction of the manual interface button;;;;;;;;;;;;;;;;;;;;;;;;;;
M8005 Z0        ; 0: Z-axis direction, forming bracket movement,
                ; 1: Z-axis direction resin groove movement

;
; ¡¾Speed / Acceleration Settings¡¿ Speed ??in mm / s, acceleration in mm / s ^ 2
M8006 I30       ; the maximum starting speed, when the speed of movement has passed this speed, it will start at this speed.
                ;This speed is mainly to prevent loss of synchronization
M8007 I15       ; the maximum rail bending speed value (corresponding to the jerk speed in the open source firmware), if the actual rail bending speed of the motion is greater than this                 ;value, will force the movement to slow down. When filling, there will be a lot of reciprocating motions, this value is large, the noise is large, and it is easy to lose                 ;steps.
                ; This value is small, slow, and print quality is relatively poor when printing speed is high
M8008 I1000      ; acceleration, the larger the value, the larger the average speed of actual operation, but the noise is also large, the value is small, and the actual speed will be                 ;smaller.



;¡¾step related parameters¡¿After the parameters are set, please print a cube, then use the ruler to measure the size to confirm that there is no problem with the parameters.
M8010 S0.000625 ; ¡¾Z mm value per step¡¿ Calculation formula: lead / ((360 / 1.8) * 16).


;
;¡¾Various speeds maximum¡¿ In order to ensure the machine can be stable, please set according to the measured results.
M8013 I5      ; maximum speed of Z motion mm/s



;¡¾Z home speed¡¿
M8015 I3      ; The first home speed is faster, the Z movement speed of the manual interface is also the same as this speed, and the Z axis Uplift is also use this value.
M8016 I3      ; The second home speed  is slower. Decreasing the second zero return speed can improve the repeat positioning accuracy of the limit. If this parameter is 0, Z will home only once.

;¡¾Z-axis demoulding rise and fall speed¡¿ During the demoulding process, first slowly rise, then rise quickly, then quickly fall
M8015 T2      ; Z-axis slow release rate
M8016 T3      ; Z-axis demoulding rapid rise and fall speed
;

; ¡¾When the Z axis is demolded, the dwell time after the rise¡¿
M8016 D10     ; the unit is ms (milliseconds),
;
; ¡¾Z maximum stroke¡¿ unit is mm
M8026 I155    ; Z maximum stroke, the stroke is the movement stroke of Z, be sure to use the ruler to measure it, carefully set, pause and print, the Z axis will stay at the maximum stroke               ;position
;

;
;¡¾Z-axis limit switch position type¡¿
M8029 I2     ; 0: One-sided limit, only use Z-limit, do not use Z+
             ;2: Bilateral limit, if Z+ and Z- limit are used at the same time, Z+ can limit the maximum stroke of Z


;
;¡¾Z limit switch wiring type¡¿ If this configuration is wrong, the motor will not move and the buzzer will be in a certain direction when the motor is operated by the manual interface.
             ; will make a drop of sound.
             ;Simple judgment method, if the configuration is normal, when the limit is changed to the limit, the buzzer will make a drip sound.
             ;When the limit is changed to the unrestricted position, the buzzer will not sound. If the opposite is found, modify this configuration.
M8029 T0     ;0: Limit switch normally open (when unrestricted - and s voltage is high level, low level when limit)
             ; 1: Limit switch normally closed (when unrestricted - and s voltage is low level, high level when limit)
;
;¡¾Z-axis limit switch position¡¿
M8029 S0     ; 0: The position of the forming bracket is the closest to the platform, and the limit is connected to Z-
             ;1: The position of the extrusion bracket is the farthest from the platform, and the limit is connected to Z+
;
;¡¾Whether the Z axis returns to (0,0,0) after homing¡¿
M8029 C0     ; 0 : Back to Z (0,0,0) position, that is, the position of the molded carrier back to the coordinate zero position
             ; ;1 : Stay in the limit position
;
;;
;¡¾LED fan LED_Fan control¡¿
M8030 I-1 ; 0: If set to 0, the default does not turn
             ;-1: keep on
             ;-2: Open when the file is printed, closed when not printing
;¡¾Mainboard cooling fan MB_Fan control¡¿
M8030 T-1    ; 0: If set to 0, the default does not turn
             ; 1: 1:0 Once exposed, the fan 2 will turn, no exposure, the fan will stop LED
             ;-1:<0 keeps on
             ;-2: Open when the file is printed, closed when not printing

;¡¾LED Light Control¡¿
M8030 S4     ; 4: Once the image is output, the LED turns on, the image is turned off, and the LED is turned off.


; ¡¾SD card / U disk support folder display¡¿
M8034 I1     ; 0: Not supported
             ; 1: support
;

;When printing ¡¾Z demoulding, total distance of lifting height per unit, unit mm, the distance = slow rising distance + fast rising distance¡¿
M8070 Z6     ; if motion z is not required, set it to 0

; ¡¾Z stripping slow rise distance] when printing¡¿
M8070 S3     ; if motion z is not required, set it to 0



;¡¾Z zero point and limit position setting¡¿0: The limit position is the same as the zero point of Z: The limit position is different from the zero point of Z
M8083 I1     ; The limit position is different from the zero point of Z and needs to be used with the M8084 Z* instruction.
;
;
;; ¡¾Z limit point and zero limit difference, the value is usually positive value¡¿
M8084 Z0     ; If you want to set the offset in the configuration, please remove the semicolon in front of the line command, and you can also automatically configure the offset by setting Z              ;to zero on the interface.
;
;
;¡¾Start LOGO time¡¿
M8085 I5000 ; boot logo duration, minimum 5000ms, maximum 6000ms

;¡¾Screensaver time¡¿
M8085 T0    ; How long does it take to enter the screen saver interface, the unit is seconds (s), when it is 0, it means that the screen saver is disabled.


;¡¾External Drive Settings¡¿
M8087 I0 T0 ; I: Settling time of the direction signal to the high level of the pulse signal, in ns
            ; T: The minimum hold time of the pulse signal, in ns. If there is no external drive control board, set it to zero.
            ; Several external drive parameters: THB7128: I100000 T0 ;;;; TB6560: I40000 T0 ;;; TB6600: I100000 T0
;
;
;
;¡¾Action after printing is completed¡¿
M8489 P3 ; action after printing is completed
         ; 0: Turn off all motors,
         ; 1: Does not work after printing,
         ; 2: After printing is completed, return to zero, the motor is not powered
         ; 3: After the printing is completed, it drops to the maximum stroke of Z, and the motor is continuously powered.

;
;¡¾¡¾¡¾¡¾¡¾¡¾¡¾¡¾Parameter¡¿¡¿¡¿¡¿¡¿¡¿¡¿¡¿ This parameter must not be less, otherwise the parameter cannot be saved to the device.
M8500    ; save configuration
;