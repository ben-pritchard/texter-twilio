require 'rails_helper'

describe Message do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it 'doesn\'t save the message if twilio gives an error' do
    message = Message.new(to: 5000, from: 5032134044, body: "yodel ey he hooo")
    expect(message.save).to be false
  end

end
