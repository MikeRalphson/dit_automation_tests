describe Samsung do

  before(:each) do
    @samsung = Samsung.new
  end

  it 'should have Platform as a superclass' do
    @samsung.should be_a_kind_of(Platform)
  end

  #it "should have the Samsung platform in the Mercury request data" do
  #  @samsung.data[:siteInfo][:Platform].should =~ /samsung/i
  #end

  # not sure about these 2 mocking specs
  it 'should be able to make catchup playlist requests' do
    @samsung = mock(Samsung)
    @samsung.stub!(:mercury_request).and_return('playlist response')

    @samsung.should_receive(:mercury_request).and_return('playlist response')
    response = @samsung.mercury_request
    response.should match('playlist response')
  end

  it 'should be able to make archive playlist requests' do
    @samsung = mock(Samsung)
    @samsung.stub!(:mercury_request).and_return('playlist response')

    @samsung.should_receive(:mercury_request).and_return('playlist response')
    response = @samsung.mercury_request
    response.should match('playlist response')
  end

  it 'should allow read-only access to the production identifier' do
    defined?(@samsung.production).should_not be_nil
  end

  it 'should allow read-only access to the expected bitrates' do
    defined?(@samsung.bitrates).should_not be_nil
  end

  it 'should allow read-only access to the expected base url' do
    defined?(@samsung.base_url).should_not be_nil
  end

  it 'should have a base url value of rtmpe' do
    @samsung.eql? /\Artmpe/
  end

  it 'should return a regular expression for the base url attribute' do
    @samsung.base_url.kind_of? Regexp
  end

  it 'should have expected bitrates of 1200000' do
    @samsung.bitrates.should match_array [1200000]
  end

end
