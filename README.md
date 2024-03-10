### Install Rust
```
#!/bin/bash

sudo apt update

sudo apt install -y curl

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

<<COMMENT

1. Input '1' to proceed with default installation
2. Restart the shell or run "source ~/.bashrc" to reload PATH environment variable

COMMENT
```

### Install mdBook
```
cargo install mdbook
```

### Initialize a book
```
mdbook init bookname
```

```cd bookname```

### Serve
```
mdbook serve --open -p 2665
```
