describe Platform do

  before(:each) do
    @platform = Platform.new
  end

  it 'should have the Mercury Playlist module' do
    @platform.class.include?(MercuryPlaylist).should == true
  end

  it 'should be able to make catchup playlist requests' do
    @platform.stub(:mercury_request).and_return('playlist response') # adds stub to existing (real) object
    @platform.should_receive(:mercury_request).and_return('playlist response') # sets the test expectation
    @platform.mercury_request # perform the interaction
  end

  it 'should be able to get the production identifier of a given response' do
    @platform.stub(:get_production_from_response).with(Savon::SOAP::Response).and_return('1/800735/2345#001')
    @platform.should_receive(:get_production_from_response).with(Savon::SOAP::Response).and_return('1/800735/2345#001')

    response = Savon::SOAP::Response
    @platform.get_production_from_response response
  end

end
