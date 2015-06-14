require 'spec_helper'
 
module Codebreaker
  describe Game do
    context "#initialize" do
    	

      it "saves secret code" do
        expect(subject.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it "saves 4 numbers secret code" do
        expect(subject.instance_variable_get(:@secret_code).size).to eq(4)
      end

      it "saves secret code with numbers from 1 to 6" do
        expect(subject.instance_variable_get(:@secret_code).join).to match(/[1-6]+/)
      end

      it "saves secret code with range 1 to 6" do
        expect_any_instance_of(Game).to receive(:rand).with(1..6).exactly(4).times
        subject
      end

       it "uses random numbers for new secret code" do
        expect_any_instance_of(Game).to receive(:rand).and_return(6,3,5,4)
        expect(subject.instance_variable_get(:@secret_code)).to eq [6,3,5,4]
      end

      it "sets attempts to 10" do
        expect(subject.instance_variable_get(:@attempts)).to eq(10)
      end
            
    end

    context "#guess" do
    	before do
        subject.instance_variable_set(:@secret_code, [6,4,6,3])
      end
      
      it {should respond_to(:guess)}

      it "decreases numbers of attempts by 1" do
      	expect{subject.guess("1234")}.to change{subject.instance_variable_get(:@attempts)}.by(-1)
      end
      it "decreases numbers of attempts by 11 and get 0" do
      	11.times do 
         subject.guess("1234")
        end 
      	expect(subject.instance_variable_get(:@attempts)).to eq(0)
      end

      it "1234" do
      	expect(subject.guess("6566")).to eq("++")
      end


      #a = (1..6).to_a
      #permutations = a.repeated_permutation(4).to_a

    end
  end
end