# frozen_string_literal: true

RSpec.describe Ipgeobase::HttpClient do
  describe '#get' do
    subject(:get) { described_class.new('ip-api.com').get('8.8.8.8') }

    let(:xml_response) do
      File.read("#{SPECS_ROOT_DIR}/fixtures/ip_api_response.xml")
    end

    before do
      stub_request(:get, 'http://ip-api.com/xml/8.8.8.8')
        .to_return(body: xml_response)
    end

    it 'responds with xml' do
      expect(subject).to eq xml_response
    end
  end
end
