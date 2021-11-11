class Cipher

  def initialize(key = (0...100).map{('a'..'z').to_a[rand(26)]}.join)
    raise ArgumentError unless key.match(/[a-z]+/)
    @key = key
  end

  def key
    @key
  end

  def encode(plaintext)
    encoded_text = @key[0, plaintext.length]
    @encoding_keys = plaintext.chars.zip(encoded_text.chars).map{|p, k| p.ord - k.ord }
    binding.irb
    encoded_text
  end
  
  def decode(ciphertext)
    binding.irb
    ciphertext.chars.map(&:ord).zip(@encoding_keys).map{|ct, ek| (ct + ek).chr}.join
  end
end

@cipher = Cipher.new
plaintext = 'abcdefghij'
ec = @cipher.encode(plaintext)
binding.irb
dc = @cipher.decode(@cipher.encode(plaintext))
binding.irb

# plaintext = 'aaaaaaaaaa'
# @cipher.decode(@cipher.key[0, 10])