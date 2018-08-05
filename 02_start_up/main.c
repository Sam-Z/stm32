#define GPIOA_CLK (*((unsigned int *)(0x40021018)))
#define GPIOA_CFG (*((unsigned int *)(0x40010804)))
#define GPIOA_DAT (*((unsigned int *)(0x4001080c)))

void delay(int i)
{
    int j = 0;
    for(j = 0; j<i; j++);
}

int main(void)
{
    // enable GPIO A clk
    GPIOA_CLK = 0x4;
    GPIOA_CFG = 0x20000;

    while(1)
    {
        GPIOA_DAT = 0;
        delay(600000);
        GPIOA_DAT = 0xffffffff;
        delay(300000);
    }
}
