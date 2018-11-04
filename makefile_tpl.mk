#
# 包含该文件之前需要定义target, c_src
#
include ../config.mk
objects     := $(c_src:.c=.o)
asm_objects := $(patsubst %.s, %.o, $(s_src))


cflag = $(addprefix -I, $(INC_PATH))
ldflag = $(addprefix -l, $(LIBS))

first_target:$(target).bin

%.o: %.c
	$(CC) -c  -mcpu=cortex-m3 -mthumb -DSTM32F10X_MD $(cflag) $^ -o $@
%.o: %.s
	$(AS) -mcpu=cortex-m3 -mthumb $^ -o $@

$(target).bin: $(objects) $(asm_objects)
	$(LD) -T../stm32f103.lds -static   $(asm_objects) $(objects)   -L../../sit $(ldflag) -L/home/zhangdi/bin/lib/gcc/arm-none-eabi/7.2.1/thumb/v7-m -lm -lc -lgcc  -o $(target).elf
	$(OBJCOPY) -O binary  $(target).elf  $(target).bin
clean:
	@rm -f ./$(target).bin ./$(target).elf ./*.o

install:
	cp ./$(target).bin ../../sit 


