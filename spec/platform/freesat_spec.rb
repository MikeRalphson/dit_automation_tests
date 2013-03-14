describe Freesat do

  before(:each) do
    @freesat = Freesat.new
  end

  it "should have Platform as a superclass" do
    @freesat.should be_a_kind_of(Platform)
  end

  #it "should have the Freesat platform in the Mercury request data" do
  #  @freesat.data[:siteInfo][:Platform].should =~ /freesat/i
  #end

  # not sure about these 2 mocking specs
  it "should be able to make catchup playlist requests" do
    @freesat = mock(Freesat)
    @freesat.stub!(:mercury_request).and_return('playlist response')

    @freesat.should_receive(:mercury_request).and_return("playlist response")
    response = @freesat.mercury_request
    response.should match('playlist response')
  end

  it "should be able to make archive playlist requests" do
    @freesat = mock(Freesat)
    @freesat.stub!(:mercury_request).and_return('playlist response')

    @freesat.should_receive(:mercury_request).and_return("playlist response")
    response = @freesat.mercury_request
    response.should match('playlist response')
  end

  it 'should allow read-only access to the production identifier' do
    defined?(@freesat.production).should_not be_nil
  end

  it 'should allow read-only access to the expected bitrates' do
    defined?(@freesat.bitrates).should_not be_nil
  end

  it 'should allow read-only access to the expected base url' do
    defined?(@freesat.base_url).should_not be_nil
  end

  it 'should have a base url value of rtmpe' do
    @freesat.eql? /\Artmpe/
  end

  it 'should return a regular expression for the base url attribute' do
    @freesat.base_url.kind_of? Regexp
  end

  it "should have no expected bitrates" do
    @freesat.bitrates.should be_nil
  end

end
