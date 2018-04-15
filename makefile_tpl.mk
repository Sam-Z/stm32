#
# 包含该文件之前需要定义target, src
#
include ../config.mk

$(target).bin: $(src)
	$(CC) -c  -mcpu=cortex-m3 -mthumb $(src) -o $(target).o	
	$(LD) -Ttext 0x8000000  $(target).o -o $(target).elf
	$(OBJCOPY) -O binary  $(target).elf  $(target).bin
clean:
	@rm ./$(target).bin ./$(target).elf ./$(target).o

install:
	cp ./$(target).bin ../../sit 


