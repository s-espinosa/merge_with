require 'rspec'
require './lib/merge_with'

RSpec.describe 'merge_with' do
  it 'can return non-conflicting hashes merged and unchanged' do
    expected = {:a => 3, :b => 1}
    actual = merge_with({:a => 3}, {:b => 1})

    expect(actual).to eq(expected)
  end

  it 'can add two numbers when given an appropriate block' do
    expected = {:a => 3, :b => 1}
    actual = merge_with({:a => 1}, {:a => 2, :b => 1}) do |a,b|
      a + b
    end

    expect(actual).to eq(expected)
  end

  it 'can subtract two numbers when given an appropriate block' do
    expected = {:a => -1, :b => 1}
    actual = merge_with({:a => 1}, {:a => 2, :b => 1}) do |a,b|
      a - b
    end

    expect(actual).to eq(expected)
  end

  it 'can concatenate values' do
    expected = {:a => "hello student", :b => "sal"}
    actual = merge_with({:a => "hello"}, {:a => "student", :b => "sal"}) do |a,b|
      a + " " + b
    end

    expect(actual).to eq(expected)
  end
end
