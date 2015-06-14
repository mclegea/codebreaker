require 'spec_helper'

describe Codebreaker do
  context "#name" do
    it "should return gem name" do
      expect(Codebreaker.name).to eq("Codebreaker")
    end
  end
end
