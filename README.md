# Templates for starting a new OCaml project

A handful of templates for starting a new OCaml project

## Requirements

* `opam`
    * macOS: `brew install opam`
    * Ubuntu 16.04 (and likely others): `sudo apt install opam`
    * See http://opam.ocaml.org/doc/Install.html otherwise and/or ask for help
* `m4` if you don't have it
    * macOS: `brew install m4`
    * Ubuntu 16.04 (and likely others): `sudo apt install m4`

## Getting setup

### macOS
```
# Install basic deps
brew install opam m4
```

### Ubuntu
```
# Install basic deps
sudo apt install opam m4
```

### Everybody

```
# Initialize opam with the latest version of OCaml, answering "yes" to the
# prompts if you want opam to modify your shell environment.
opam init --compiler=4.05.0

# Setup your environment variables
eval $(opam config env)

# Install the libraries and tools we need
opam install merlin ocp-indent odoc utop jbuilder \
             alcotest qcheck benchmark logs cmdliner

# Get hacking
```
