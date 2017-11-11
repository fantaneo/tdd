class Semver
  attr_reader :major, :minor, :patch

  def initialize(major: 0, minor: 0, patch: 0)
    [major, minor, patch].each do |num|
      fail PositiveNumberError unless valid_positive_number?(num)
    end

    @major = major
    @minor = minor
    @patch = patch
  end

  def to_s
    [@major, @minor, @patch].join(".")
  end

  def == (version)
    return false unless major == version.major
    return false unless minor == version.minor
    return false unless patch == version.patch
    true
  end

  def valid_positive_number?(number)
    number.is_a?(Integer) && number >= 0
  end

  class PositiveNumberError < StandardError; end
end
