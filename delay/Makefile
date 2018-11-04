include ../config.mk 

cflag = $(addprefix -I, $(INC_PATH))
src    := $(basename  $(wildcard *.c))
target := lib$(src).a
obj    := $(src).o

$(target):$(src).o
	$(AR) crv $@ $<

$(obj):$(src).c $(src).h
	$(CC) -c $(src).c  $(cflag) -mcpu=cortex-m3 -mthumb  -DSTM32F10X_MD -o $@
install:
	cp $(target) ../../sit
clean:
	rm *.o *.a

