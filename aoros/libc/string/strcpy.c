#include "../include/string.h"

char* strcpy (char* dest, char* src)
{
    char* tmp = dest;

    while ((*dest++ = *src++) != 0);

    return tmp;
}
