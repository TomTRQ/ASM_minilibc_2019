/*
** EPITECH PROJECT, 2020
** test_assembly.c
** File description:
** minilibc
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>

Test(assembly, testing_strlen)
{
    char str[12] = "Test length\0";

    cr_assert(strlen(str)== 11);
}

Test(assembly, testing_strchr)
{
    char str[23] = "Test character finding\0";

    cr_assert(strcmp(strchr(str, 't'), "t character finding") == 0);
}

Test(assembly, testing_memset)
{

}