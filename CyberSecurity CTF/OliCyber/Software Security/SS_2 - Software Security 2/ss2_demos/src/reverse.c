#include <stdio.h>
#include <string.h>

#define KEY_LEN 32

#define STR_X(x) #x
#define STR(x) STR_X(x)

static const char key_init[KEY_LEN] = {
    0x60, 0x54, 0x28, 0x3b, 0x35, 0x8d, 0xb5, 0x62,
    0x38, 0xa0, 0x9a, 0x0c, 0x64, 0xc2, 0x78, 0x23,
    0x7d, 0xd5, 0x99, 0xcd, 0x52, 0xdd, 0x70, 0xb4,
    0xbb, 0x62, 0x82, 0x27, 0x3f, 0x0d, 0x50, 0x83
};

static const char *key_alpha =
    "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

void gen_key(char *key, const char *name)
{
    memcpy(key, key_init, KEY_LEN);

    for (; *name; name++) {
        char c = *name;
        for (size_t i = 0; i < KEY_LEN; i++)
            key[i] ^= c * key[(i + 1) % KEY_LEN];
    }

    const size_t alpha_len = strlen(key_alpha);
    for (size_t i = 0; i < KEY_LEN; i++)
        key[i] = key_alpha[(unsigned)key[i] % alpha_len];
    key[KEY_LEN] = '\0';
}

int main()
{
    char name[100];
    char input_key[KEY_LEN + 1];
    char key[KEY_LEN + 1];

    printf("Insert name: ");
    scanf("%99s", name);

    printf("Insert key: ");
    scanf("%" STR(KEY_LEN) "s", input_key);

    gen_key(key, name);

    if (!strcmp(key, input_key))
        puts("Good job! Enjoy.");
    else
        puts("Wrong key.");
}

