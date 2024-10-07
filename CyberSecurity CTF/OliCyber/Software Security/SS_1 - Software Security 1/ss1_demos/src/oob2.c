#include <stdio.h>
#include <string.h>

int main()
{
    struct {
        char a[4];
        int b[3];
    } s;

    memset(&s, 0, sizeof(s));

    int idx;
    printf("Index: ");
    scanf("%d", &idx);
    int value;
    printf("Value: ");
    scanf("%d", &value);
    s.a[idx] = value;

    for (int i = 0; i < 3; i++)
        printf("b[%d] = %d (0x%08x)\n", i, s.b[i], s.b[i]);
}
