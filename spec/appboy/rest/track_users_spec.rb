require 'spec_helper'

describe Appboy::REST::TrackUsers do
  let(:http) { double(:http) }

  let(:payload) {{
    attributes: :attributes,
    events: :events,
    purchases: :purchases
  }}

  let(:api_key) { :api_key }

  subject { described_class.new(api_key) }

  before { subject.http = http }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with '/users/track',
        payload

    subject.perform(payload)
  end
end
