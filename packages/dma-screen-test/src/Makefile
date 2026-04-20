%.o: %.c
	$(CC) $(PKG_CFLAGS) $(CFLAGS) -c $< -o $@

main: main.c
	$(CC) main.c -o main

all:  main

clean:
	rm -fv main
