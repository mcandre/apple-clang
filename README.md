# mcandre/apple-clang: a Docker image with Apple Clang

# EXAMPLE

```console
$ cd example

$ docker run --rm -v "$(pwd):/src" mcandre/apple-clang sh -c "cd /src && clang++ -o hello hello.cpp"

$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, not stripped
```

