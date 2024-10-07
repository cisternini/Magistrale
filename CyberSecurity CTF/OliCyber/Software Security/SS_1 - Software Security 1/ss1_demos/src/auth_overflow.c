#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int check_authentication()
{
	int auth_flag = 0;
	char password_buffer[16];

	printf("Enter password: ");
	scanf("%s", password_buffer);

	if (!strcmp(password_buffer, "hacktheworld"))
		auth_flag = 1;
	if (!strcmp(password_buffer, "olicyber"))
		auth_flag = 1;

	printf("auth_flag = %d (0x%08x)\n", auth_flag, auth_flag);

	return auth_flag;
}

int main()
{
    if (check_authentication())
        puts("Access granted!");
    else
        puts("Access denied.");
}
