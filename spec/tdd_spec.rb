require 'rspec'
require 'tdd'

describe "#dups" do

  let(:no_duplicates){Array.new([1,2,3,4])}
  let(:duplicates){Array.new([1,2,2,3,4,4,4])}

  it "returns same array if no duplicates" do
    expect(no_duplicates.my_uniq).to eq ([1,2,3,4])
  end
  it "returns array without duplicates if there are duplicates" do
    expect(duplicates.my_uniq).to eq([1,2,3,4])
  end

  it "works with an empty array" do
    expect([].my_uniq).to eq([])
  end 
end

describe "#two_sum" do
  let(:some_array) { [-1, 0, 2, -2, 1] }

  it "returns pairs that sum to zero" do
    expect(some_array.two_sum).to eq([[0, 4], [2, 3]])
  end

  it "returns pairs in correct order" do
    expect(some_array.two_sum).to_not include([4, 0])
  end
end

describe "#my_transpose" do
  let(:single_element_array) { [[1]] }
  let(:square_array) { [[1, 2], [3, 4]] }

  it "works with an empty array" do
    expect([].my_transpose).to eq([])
  end

  it "works with single element array" do
    expect(single_element_array.my_transpose).to eq([[1]])
  end

  it "works with a square array" do
    expect(square_array.my_transpose).to eq([[1, 3], [2, 4]])
  end
end

describe "#stock_picker" do

  it "works on a sorted array" do
    prices = [1,2,3,4,5]
    expect(stock_picker(prices)).to eq([0, 4])
  end

  it "works on a reverse sorted array" do
    prices = [10, 6, 3, 1]
    expect(stock_picker(prices)).to eq([2, 3])
  end

  it "works on an array that starts high" do
    prices = [50, 5, 9, 10, 4]
    expect(stock_picker(prices)).to eq([1, 3])
  end

  it "ensures that the order is correct if it ends low" do
    prices = [5, 6, 3, 8, 1]
    expect(stock_picker(prices)).to eq([2, 3])
  end

  it "works with a constant price" do
    prices = [1, 1, 1, 1, 1]
    expect(stock_picker(prices)).to eq([0, 1])
  end


end


describe "towers_of_hanoi" do
  let(:game) { TowersOfHanoi.new }
  let(:small_game) { TowersOfHanoi.new(1) }

  context "#initialize" do
    it "initializes correctly on default" do
      expect(game.stacks).to eq([[3, 2, 1], [], []])
    end

    it "initializes correctly with an arguement" do
      expect(small_game.stacks).to eq([ [1], [], [] ])
    end

  end

  context "#move" do

     it "moves a disc from stack with single disc to empty stack" do
       small_game.move(0,1)
       expect(small_game.stacks).to eq([ [], [1], [] ])
     end

     it "moves the top disc from a stack of multiple discs" do
       game.move(0,1)
       expect(game.stacks).to eq( [ [3, 2], [1], [] ])
     end

     it "doesn't move a larger disc on a smaller disc" do
       game.move(0, 1)
       expect{game.move(0, 1)}.to raise_error("Cannot move on a smaller disk")
     end

     it "raises error if move is from an empty stack" do
       expect{game.move(1,2)}.to raise_error("Cannot move from an empty stack")
     end

  end

  context "#won?" do
      context "doesn't return true if the game isn't over" do

        it "doesn't return true at the beginning" do
          expect(game.won?).to be(false)
        end

        it "doesn't return true if the first stack is empty" do
          game = TowersOfHanoi.new(2)
          game.move(0, 1)
          game.move(0, 2)
          expect(game.won?).to be false
        end

      end
      context "does return true if the game is over" do
      it  "can win on the second stack" do
        small_game.move(0,1)
        expect(small_game.won?).to be true
      end

      it  "can win on the third stack" do
        small_game.move(0,2)
        expect(small_game.won?).to be true
      end
    end
  end
end
