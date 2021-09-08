# mcandre/apple-clang: Apple-vendor Clang in a handy Docker tin

# EXAMPLE

```console
$ cd example
$ docker pull mcandre/apple-clang
$ docker run -v "$(pwd):/src" mcandre/apple-clang sh -c "cd /src && apple-clang++ -o hello hello.cpp && ./hello"
...
```
