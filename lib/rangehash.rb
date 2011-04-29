$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Rangehash
  VERSION = '0.0.3'
end

class RangeHash < Hash
  def [](key)
    value = find_value key
    value == :notfound ? default : value
  end

  def fetch(key, default = nil)
    value = find_value key
    return value if value != :notfound
    return default if default != nil
    yield key if block_given?
    raise IndexError, "key " + key.to_s + " not found" if not block_given?
  end

  def assoc(key)
    found = find_pair(key)
    found.empty? ? nil : found.first
  end

  def key?(key)
    found = find_pair(key)
    !(found.empty?)
  end

  alias_method :has_key?, :key?
  alias_method :include?, :key?
  alias_method :member?, :key?

  def delete(key)
    super
  end

  def sorted_keys
    keys.sort do |a, b|
      sort_key(a) <=> sort_key(b)
    end
  end
  
  private
  def find_pair(key)
    each.select {|k, v| (k == key || k === key)}
  end
  
  def find_value(key)
    (find_pair(key).first || [nil, :notfound])[1]
  end

  def sort_key(a)
    return Range === a ? a.first : a
  end
end
