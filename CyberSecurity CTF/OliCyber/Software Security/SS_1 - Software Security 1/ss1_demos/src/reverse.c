#include <stdio.h>
#include <string.h>

int check_key(const char *buf)
{
    if (strlen(buf) != 10)
        return 0;

    for (int i = 0; i < 5; i++) {
        if (buf[i] != buf[9-i])
            return 0;
    }

    return 1;
}

int main()
{
    char buf[16];

    printf("Insert key: ");
    scanf("%15s", buf);

    if (check_key(buf))
        puts("Good job! Enjoy.");
    else
        puts("Wrong key.");
}

