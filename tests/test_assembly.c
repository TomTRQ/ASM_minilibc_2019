/*
** EPITECH PROJECT, 2020
** test_assembly.c
** File description:
** minilibc
*/

#include <stdio.h>
#include <string.h>

void tests_strlen(void)
{
    printf("%ld\n", strlen("First test"));
    printf("%ld\n", strlen("Second test"));
    printf("%ld\n", strlen("Bonjour"));
    printf("%ld\n", strlen(""));
}

void tests_strchr(void)
{
    printf("%s\n", strchr("Bonjour", 'o'));
    printf("%s\n", strchr("Oui oui", 'u'));
    if (strchr("Test numéro 3", 'z') == NULL)
        printf("NULL VALUE\n");
}

void tests_rindex()
{
    printf("%s\n", rindex("Oui oui", 'u'));
    printf("%s\n", rindex("Oui", 'u'));
    if (rindex("Oui", 'z') == NULL)
        printf("NULL VALUE\n");
}

void tests_strcasecmp()
{
    printf("%d\n", strcasecmp("first", "FIRST"));
    printf("%d\n", strcasecmp("SeCoNd", "sEcOnD"));
    printf("%d\n", strcasecmp("first", "SECOND"));
}

void tests_strcmp()
{
    printf("%d\n", strcmp("first", "first"));
    printf("%d\n", strcmp("second", "second"));
    printf("%d\n", strcmp("first", "second"));
}

void tests_strcspn()
{
    printf("%ld\n", strcspn("first", "tr"));
    printf("%ld\n", strcspn("second", "cs"));
    printf("%ld\n", strcspn("first and second", "cad"));
}

void tests_strncmp()
{
    printf("%d\n", strncmp("first", "first", 5));
    printf("%d\n", strncmp("sez", "sec", 3));
    printf("%d\n", strncmp("first", "second", 0));
}

void tests_strpbrk()
{
    printf("%s\n", strpbrk("Bonjour", "rn"));
    printf("%s\n", strpbrk("Oui ouiz", "zi"));
    if (strpbrk("Test numéro 3", "z") == NULL)
        printf("NULL VALUE\n");
}

void tests_strstr()
{
    printf("%s\n", strstr("first second", " se"));
    printf("%s\n", strstr("second first", "first"));
    if (strstr("first second third", "fourth") == NULL)
        printf("NULL VALUE");
}

void tests_memcpy()
{
   char str[50];
   char temp[50];
   char str2[50];
   char temp2[50];

    strcpy(str, "This is string.h libary function");
    strcpy(temp, "Oui oui");
    memcpy(str, temp, 7);
    printf("%s\n", str);

    strcpy(str2, "This is string.h libary function");
    strcpy(temp2, "ah");
    memcpy(str2, temp2, 2);
    printf("%s\n", str2);
}

void tests_memset()
{
   char str[50];
   char str2[50];

    strcpy(str, "This is string.h libary function");
    memset(str, '$', 7);
    printf("%s\n", str);

    strcpy(str2, "This is string.h libary function");
    memset(str2, '=', 15);
    printf("%s\n", str2);
}

void tests_memmove()
{
    char str[50];
    char str2[50];

    strcpy(str, "This is string.h libary function");
    strcpy(str2, "This is string.h libary function");
    memmove(str, str2, 7);
    printf("%s\n", str);
}

void tests_string()
{
    tests_rindex();
    tests_strcasecmp();
    tests_strchr();
    tests_strcmp();
    tests_strcspn();
    tests_strlen();
    tests_strncmp();
    tests_strpbrk();
    tests_strstr();
}

void tests_memory()
{
    tests_memcpy();
    tests_memmove();
    tests_memset();
}

int main(void)
{
    tests_string();
    tests_memory();
}