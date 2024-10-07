#include <stdio.h>
#include <stdlib.h>
#include <sys/random.h>

void disable_buffering()
{
    // avoid buffering issues - you can ignore this
    setvbuf(stdin, 0, _IONBF, 0);
    setvbuf(stdout, 0, _IONBF, 0);
}

void win(void)
{
    puts("Hai vinto! Ecco un premio:");
    system("sh");
}

void lose(void)
{
    puts("Hai perso :(");
}

int main()
{
    char buf[32];
    unsigned long num;

    disable_buffering();

    getrandom(&num, sizeof(num), 0);

    printf("Inserisci numero: ");
    scanf("%s", buf);

    if (strtoul(buf, NULL, 0) == num)
        win();
    else
        lose();
}
