#include <stdio.h>
#include <fcntl.h>

int main() {
    int fd;
    char buf[100];

    fd = open("flag.txt", O_RDONLY);
    printf("rdonly: %d\n", O_RDONLY);
    printf("fd: %d\n", fd);

    read(3, &buf, 30);
    write(0, &buf, 30);

    close(fd);
    return 0;
}
