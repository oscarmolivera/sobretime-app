require 'rails_helper'

describe 'overtime calculations' do
  it 'calculates accurate overtime values for salaried employee' do
    thousand_34 = SalariedOvertimeCalculator.calculate  1000.0, 43.0
    nine_hundred_55 = SalariedOvertimeCalculator.calculate 900.0, 55.5

    expect(thousand_34.to_i).to eq(34)
    expect(nine_hundred_55.to_i).to eq(125)
  end

  it 'returns cero for an overtime amount if the total hours are 40 or under' do
    forty_or_under = SalariedOvertimeCalculator.calculate  10.2, 1.2 
    
    expect(forty_or_under.to_i).to eq(0.0)
    
  end
end