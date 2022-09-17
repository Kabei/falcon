# Falcon

Falcon Erlang-port, Falcon is a post-quantum cryptography library (Digital Signature Algorithm)

[Website](https://falcon-sign.info)

## Features
Current CRYPTO_LOGN is 9\
Current SEED_SIZE is 48

|Security|LOGN|
|----|---|
|Falcon-512|9|
|Falcon-1024|10|

|Falcon-512 |Size (bytes)|
|-----------|-----|
|Public key | 897 |
|Private key| 1281|
|Signature  | 625 (666)|

>Note: Signature is 625 max size because initial 41 characters are removed <<57, 0, 0, 0...>>

|Falcon-1024|Size (bytes)|
|-----------|-----|
|Public key | 1793|
|Private key| 2305|
|Signature  | 1239 (1280)|

>Note: Signature is 1239 max size because initial 41 characters are removed <<58, 0, 0, 0...>>

## Compilation

Install build-essential and erlang-dev before compile

```bash
mix deps.get
make -f Makefile
make -f Makefile1024
mix compile
```

## Installation

```elixir
def deps do
  [
    {:falcon, "~> 0.1.0"}
  ]
end
```

Umbrella Projects:
```elixir
def deps do
  [
    {:falcon, in_umbrella: true}
  ]
end
```

## Test
```bash
mix run test/falcon_test.exs
mix run test/falcon_1024_test.exs
```