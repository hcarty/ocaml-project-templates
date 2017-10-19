# A basic application written in OCaml

A basic application with a few niceties out of the box:
* Logging setup and configurable from the command line (defaults to `WARN`
  level logging)
* Some convenience libraries ready to use

## Compile

```
make
```

## Run

```
jbuilder exec myapp
```

## Usage

```
jbuilder exec myapp -- --help
```

## Make it your own

1. You'll need to rename `myapp.opam`, replacing `myapp` with whatever name you'd
   like your application to have.
2. Update `src/jbuild` and replace the `myapp` name with the whatever name
   you've given to your application.
3. Use your new application name in place of `myapp` in the `Run` and `Usage`
   sections above.
