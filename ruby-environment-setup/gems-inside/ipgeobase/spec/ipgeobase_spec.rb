# frozen_string_literal: true

RSpec.describe Ipgeobase do
  it 'has a version number' do # wow (0_0)
    expect(Ipgeobase::VERSION).not_to be nil
  end

  describe '.lookup' do
    subject(:lookup) { described_class.lookup('8.8.8.8') }

    let(:xml_response) do
      File.read("#{SPECS_ROOT_DIR}/fixtures/ip_api_response.xml")
    end

    let(:expected_meta_data) do
      {
        lat: '39.03',
        lon: '-77.5',
        city: 'Ashburn',
        country: 'United States',
        country_code: 'US'
      }
    end

    before do
      stub_request(:get, 'http://ip-api.com/xml/8.8.8.8')
        .to_return(body: xml_response)
    end

    it 'returns object with ip meta data' do
      ip_meta = lookup
      expect(ip_meta.lat).to eq expected_meta_data[:lat]
      expect(ip_meta.lon).to eq expected_meta_data[:lon]
      expect(ip_meta.city).to eq expected_meta_data[:city]
      expect(ip_meta.country).to eq expected_meta_data[:country]
      expect(ip_meta.country_code).to eq expected_meta_data[:country_code]
    end
  end
end
