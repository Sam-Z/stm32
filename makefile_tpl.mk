#
# 包含该文件之前需要定义target, c_src
#
include ../config.mk
objects     := $(patsubst %.c, %.o, $(c_src))
asm_objects := $(patsubst %.s, %.o, $(s_src))

#objects += start_up.o


first_target:$(target).bin

%.o: %.c
	$(CC) -c  -mcpu=cortex-m3 -mthumb $^ -o $@
%.o: %.s
	$(AS) -mcpu=cortex-m3 -mthumb $^ -o $@

$(target).bin: $(objects) $(asm_objects)
	$(LD) -T../stm32f103.lds $(asm_objects) $(objects) -o $(target).elf
	$(OBJCOPY) -O binary  $(target).elf  $(target).bin
clean:
	@rm -f ./$(target).bin ./$(target).elf ./*.o

install:
	cp ./$(target).bin ../../sit 


