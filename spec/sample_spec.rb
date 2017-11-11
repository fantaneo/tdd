require "spec_helper"
require_relative '../src/sample'

RSpec.describe "Semver" do
  describe "major, minor, patch 番号を与えて文字列表現を取得する" do
    it "major=1, minor=4, patch=2は'1.4.2'を返す" do
      expect(Semver.new(major: 1, minor: 4, patch: 2).to_s).to eq "1.4.2"
    end

    it "major=2, minor=5, patch=3は'2.5.3'を返す" do
      expect(Semver.new(major: 2, minor: 5, patch: 3).to_s).to eq "2.5.3"
    end
  end

  describe "他のバージョンオブジェクトと等しいかどうかを判定する" do
    it "バージョン 1.4.2 は バージョン 1.4.2 と等しい" do
      version_1_4_2_a = Semver.new(major: 1, minor: 4, patch: 2)
      version_1_4_2_b = Semver.new(major: 1, minor: 4, patch: 2)
      expect(version_1_4_2_a == version_1_4_2_b).to be_truthy
    end

    it "バージョン 1.4.2 は バージョン 2.1.0 と等しくない" do
      version_1_4_2 = Semver.new(major: 1, minor: 4, patch: 2)
      version_2_1_0 = Semver.new(major: 2, minor: 1, patch: 0)
      expect(version_1_4_2 == version_2_1_0).to be_falsey
    end
  end

  describe "major, minor, patch フィールドのいずれかが正の数以外であれば例外を発生する" do
    it "majorが-1の場合、例外が発生する" do
      expect { Semver.new(major: -1, minor: 4, patch: 2) }.to raise_error(Semver::PositiveNumberError)
    end
    it "minorが-1の場合、例外が発生する" do
      expect { Semver.new(major: 1, minor: -1, patch: 2) }.to raise_error(Semver::PositiveNumberError)
    end
    it "patchが-1の場合、例外が発生する" do
      expect { Semver.new(major: 1, minor: 1, patch: -1) }.to raise_error(Semver::PositiveNumberError)
    end
    it "majorがaの場合、例外が発生する" do
      expect { Semver.new(major: 'a', minor: 4, patch: 2) }.to raise_error(Semver::PositiveNumberError)
    end
    it "minorがaの場合、例外が発生する" do
      expect { Semver.new(major: 1, minor: 'a', patch: 2) }.to raise_error(Semver::PositiveNumberError)
    end
    it "patchがaの場合、例外が発生する" do
      expect { Semver.new(major: 1, minor: 1, patch: 'a') }.to raise_error(Semver::PositiveNumberError)
    end
  end
end
