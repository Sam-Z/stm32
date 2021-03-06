//
// led 由PA12控制，低电平点亮。
//
.equ STACK_TOP, 0x20008000
.text
.global Reset_Handler 
.syntax unified
.section .isr_vector, "a", %progbits 
Reset_Handler:
    .word STACK_TOP
    .word start
    .type start, function
start:

//使能GPIOA模块时钟
ldr r0, =0x40021000
ldr r1, =0x4
str r1, [r0, #0x18]

//设置GPIOA12引脚为推挽输出
ldr r0, =0x40010800
mov r1, #0x20000
str r1, [r0, #0x4]

//GPIO A output  0
ldr r0, =0x40010800

loop:
// led off
ldr  r1, =#0xfffffff
str r1, [r0, #0xc]

bl delay

// led on
ldr r1, =0
str r1, [r0, #0xc]         

bl delay

b loop

deadloop:
   b deadloop

delay:
    ldr  r5, =0xfffff
__delay:
    sub r5, r5, #1
    cmp r5, #0
    bne __delay
    mov pc,  lr
.end
