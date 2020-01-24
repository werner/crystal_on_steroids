require "uri"
require "http/params"

class Object
  # Alias for `to_s`
  def to_param
    to_s
  end

  # Converts an object into a string suitable for use as a URL query string,
  # no key provided
  def to_query
    URI.encode_www_form(to_param.to_s)
  end

  # Converts an object into a string suitable for use as a URL query string,
  # using the given `namespace` as the param name.
  def to_query(namespace)
    "#{URI.encode_www_form(namespace.to_param)}=#{URI.encode_www_form(to_param.to_s)}"
  end
end

struct Nil
  # Return `self`
  def to_param
    self
  end
end

struct Bool
  # Return `self`
  def to_param
    self
  end
end

class Array(T)
  # Calls `to_param` on all its elements and joins the result with
  # slashes.
  #
  # source: Rails ActiveSupport
  def to_param
    map(&.to_param).join '/'
  end

  # Cast an array as a HTTP::Params and buils an url-encode string.
  #
  # ```
  # ["michael", "jhon"].to_query("user")
  # => "user%5B%5D=michael&user%5B%5D=jhon"
  # ```
  def to_query(namespace)
    prefix = "#{namespace}[]"

    if empty?
      nil.to_query(prefix)
    else
      map { |value| value.to_query(prefix) }.join "&"
    end
  end
end

class Hash(K, V)
  # Returns a string representation of the receiver suitable for use as a URL
  # query string:
  #
  # ```
  # {name: "David", nationality: "Danish"}.to_query
  # # => "name=David&nationality=Danish"
  # ```
  #
  # An optional namespace can be passed to enclose key names:
  #
  # ```
  # {name: "David", nationality: "Danish"}.to_query("user")
  # # => "user%5Bname%5D=David&user%5Bnationality%5D=Danish"
  # ```
  #
  def to_query(namespace = nil)
    map do |key, value|
      value.to_query(namespace ? "#{namespace}[#{key}]" : key)
    end.compact.sort!.flatten.join "&"
  end

  # Alias for to_query
  def to_param
    to_query
  end
end

struct NamedTuple
  def to_query(namespace = nil)
    to_h.to_query(namespace)
  end
end
