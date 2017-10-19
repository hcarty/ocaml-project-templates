# A basic library written in OCaml

A basic library with a few niceties out of the box:
* Logging available (with library-specific logging)
* Some convenience libraries ready to use
* Basic tests
* Basic benchmarks

## Compile

```
make
```

## Load an interactive environment for testing

```
make repl
```

Your library will be available from this environment.

## Run tests

```
make test
```

## Run benchmarks

```
make benchmark
```

## Build documentation

```
make doc
```

## Upload documentation to github pages

*NOTE:* This requires a repo you can push to...

```
make gh-pages
```

## Make it your own

1. You'll need to rename `mylib.opam`, replacing `mylib` with whatever name you'd
   like your library to have.
2. Update `src/jbuild` and replace the `mylib` name with the whatever name
   you've given to your library.
3. Rename `src/mylib.ml` and `src/mylib.mli` to use the same name used in the
   `*.opam` file and `src/jbuild`.
4. Update the tests and benchmarks to use your new library name.
