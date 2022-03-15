defmodule AlphabetCipher.Coder do

  def alphabet_cols() do
    %{
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6,
      h: 7,
      i: 8,
      j: 9,
      k: 10,
      l: 11,
      m: 12,
      n: 13,
      o: 14,
      p: 15,
      q: 16,
      r: 17,
      s: 18,
      t: 19,
      u: 20,
      v: 21,
      w: 22,
      x: 23,
      y: 24,
      z: 25
    }
  end

  def alphabet_rows() do
  %{
    a: String.graphemes("abcdefghijklmnopqrstuvwxyz"),
    b: String.graphemes("bcdefghijklmnopqrstuvwxyza"),
    c: String.graphemes("cdefghijklmnopqrstuvwxyzab"),
    d: String.graphemes("defghijklmnopqrstuvwxyzabc"),
    e: String.graphemes("efghijklmnopqrstuvwxyzabcd"),
    f: String.graphemes("fghijklmnopqrstuvwxyzabcde"),
    g: String.graphemes("ghijklmnopqrstuvwxyzabcdef"),
    h: String.graphemes("hijklmnopqrstuvwxyzabcdefg"),
    i: String.graphemes("ijklmnopqrstuvwxyzabcdefgh"),
    j: String.graphemes("jklmnopqrstuvwxyzabcdefghi"),
    k: String.graphemes("klmnopqrstuvwxyzabcdefghij"),
    l: String.graphemes("lmnopqrstuvwxyzabcdefghijk"),
    m: String.graphemes("mnopqrstuvwxyzabcdefghijkl"),
    n: String.graphemes("nopqrstuvwxyzabcdefghijklm"),
    o: String.graphemes("opqrstuvwxyzabcdefghijklmn"),
    p: String.graphemes("pqrstuvwxyzabcdefghijklmno"),
    q: String.graphemes("qrstuvwxyzabcdefghijklmnop"),
    r: String.graphemes("rstuvwxyzabcdefghijklmnopq"),
    s: String.graphemes("stuvwxyzabcdefghijklmnopqr"),
    t: String.graphemes("tuvwxyzabcdefghijklmnopqrs"),
    u: String.graphemes("uvwxyzabcdefghijklmnopqrst"),
    v: String.graphemes("vwxyzabcdefghijklmnopqrstu"),
    w: String.graphemes("wxyzabcdefghijklmnopqrstuv"),
    x: String.graphemes("xyzabcdefghijklmnopqrstuvw"),
    y: String.graphemes("yzabcdefghijklmnopqrstuvwx"),
    z: String.graphemes("zabcdefghijklmnopqrstuvwxy")
    }
  end

  def encode(keyword, message) do
    msg = message |> String.downcase() |> String.split() |> Enum.join() 
    key = keyword |> String.downcase() |> String.split() |> Enum.join() |> String.duplicate(div(String.length(msg),String.length(keyword))+1) |> String.graphemes()
    msg_and_key = Enum.zip(key, msg |> String.graphemes())
    encode_message = msg_and_key |> Enum.with_index() |> Enum.map(fn ({tuple, index})-> 
    k_1 = elem(tuple, 0)
    m_1 = elem(tuple, 1)
    row = alphabet_rows[String.to_atom(k_1)]
    col = alphabet_cols[String.to_atom(m_1)]
    row |> Enum.at(col)
    end)
    IO.puts("Encoded message: #{encode_message}")
  end

  def decode(keyword, message) do
    "decodeme"
  end

  def decipher(cipher, message) do
    "decypherme"
  end

end


