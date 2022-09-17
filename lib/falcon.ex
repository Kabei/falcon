defmodule Falcon do
  @on_load :load_nifs
  @file_version 0
  @type_alg "FAL"

  def load_nifs do
    path = :filename.join(:code.priv_dir(:falcon), 'falcon_nif')
    :erlang.load_nif(path, 0)
  end

  @spec gen_key_pair() :: {:ok, binary(), binary()} | {:error, atom()}
  def gen_key_pair do
    raise "Function gen_key_pair is not implemented!"
  end

  @spec gen_pub_key(binary()) :: {:ok, binary()} | {:error, atom()}
  def gen_pub_key(priv_key)

  def gen_pub_key(_) do
    raise "Function gen_pub_key is not implemented!"
  end

  @spec gen_keys_from_seed(binary()) :: {:ok, binary(), binary()} | {:error, atom()}
  def gen_keys_from_seed(seed)

  def gen_keys_from_seed(_) do
    raise "Function gen_keys_from_seed is not implemented!"
  end

  @spec sign(binary(), binary()) :: {:ok, binary()} | {:error, atom()}
  def sign(priv_key, data)

  def sign(_, _) do
    raise "Function sign is not implemented!"
  end

  @spec verify(binary(), binary(), binary()) :: :ok | :error
  def verify(msg, sig, pub_key)

  def verify(_, _, _) do
    raise "Function sign is not implemented!"
  end

  def pubkey_size, do: 897
  def secret_key_size, do: 1281

  @spec read_file!(Path.t()) :: {binary, binary}
  def read_file!(path) do
    <<file_version::8, type::bytes-size(3), rest::binary>> = File.read!(path)

    cond do
      file_version != @file_version ->
        throw(:bad_version)

      type != @type_alg ->
        throw(:bad_type)

      true ->
        cond do
          897 + 1281 == byte_size(rest) ->
            <<pk::bytes-size(897), sk::bytes-size(1281)>> = rest
            {pk, sk}

          1793 + 2305 == byte_size(rest) ->
            <<pk::bytes-size(1793), sk::bytes-size(2305)>> = rest
            {pk, sk}

          true ->
            throw(:bad_data)
        end
    end
  end

  @spec write_file!(Path.t(), {iodata, iodata}) :: :ok
  def write_file!(path, {pk, sk}) do
    data = <<@file_version>> <> @type_alg <> pk <> sk
    File.write!(path, data)
  end
end
