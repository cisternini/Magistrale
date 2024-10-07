#include <stdio.h>

void f3(void)
{
    puts("Hello from f3!");
}

void f2(void)
{
    puts("Hello from f2!");
}

void f1(void)
{
    puts("Hello from f1!");
    f2();
    puts("Bye from f1!");
}

int main()
{
    puts("Hello from main!");
    f1();
    puts("Bye from main!");
}
