describe Ps3 do

  before(:each) do
    @ps3 = Ps3.new
  end

  it "should have Platform as a superclass" do
    @ps3.should be_a_kind_of(Platform)
  end

  #it "should have the Ps3 platform in the Mercury request data" do
  #  @ps3.data[:siteInfo][:Platform].should =~ /ps3/i
  #end

  # not sure about these 2 mocking specs
  it "should be able to make catchup playlist requests" do
    @ps3 = mock(Ps3)
    @ps3.stub!(:mercury_request).and_return('playlist response')

    @ps3.should_receive(:mercury_request).and_return("playlist response")
    response = @ps3.mercury_request
    response.should match('playlist response')
  end

  it "should be able to make archive playlist requests" do
    @ps3 = mock(Ps3)
    @ps3.stub!(:mercury_request).and_return('playlist response')

    @ps3.should_receive(:mercury_request).and_return("playlist response")
    response = @ps3.mercury_request
    response.should match('playlist response')
  end

  it 'should allow read-only access to the production identifier' do
    defined?(@ps3.production).should_not be_nil
  end

  it 'should allow read-only access to the expected bitrates' do
    defined?(@ps3.bitrates).should_not be_nil
  end

  it 'should allow read-only access to the expected base url' do
    defined?(@ps3.base_url).should_not be_nil
  end

  it 'should have a base url value of rtmpe' do
    @ps3.eql? /\Artmpe/
  end

  it 'should return a regular expression for the base url attribute' do
    @ps3.base_url.kind_of? Regexp
  end

  it "should have expected bitrates of 800000" do
    @ps3.bitrates.should match_array [800000]
  end

end
