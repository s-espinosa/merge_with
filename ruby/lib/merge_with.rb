def merge_with(hash_1, hash_2)
  all_keys = (hash_1.keys + hash_2.keys).uniq
  return_hash = {}

  all_keys.each do |key|
    if hash_1.keys.include?(key) && hash_2.keys.include?(key)
      return_hash[key] = yield(hash_1[key], hash_2[key])
    elsif hash_1.keys.include?(key)
      return_hash[key] = hash_1[key]
    elsif hash_2.keys.include?(key)
      return_hash[key] = hash_2[key]
    end
  end

  return_hash
end
