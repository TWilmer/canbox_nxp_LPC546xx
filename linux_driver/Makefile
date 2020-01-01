obj-m += canbox_LPC546xx.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

test:
	sudo insmod canbox_LPC546xx.ko
	sudo rmmod canbox_LPC546xx.ko
	dmesg

