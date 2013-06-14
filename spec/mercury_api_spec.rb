describe 'the Mercury API library' do

  before(:each) do
    @mercury = MercuryApi.new
  end

  describe 'the find_value_in_hash method'

  it 'should find a simple hash value' do
    hash = {:first => 'ben', :last => 'snape'}
    @mercury.find_value_in_hash(:last, hash).should == 'snape'
  end

  it 'should find a nested hash value' do
    hash = {:person => {:title => 'mr', :name => {:first => 'ben', :last => 'snape'}, :interests => 'football'}}
    @mercury.find_value_in_hash(:first, hash).should == 'ben'
  end

  it 'should find a value after a nested hash' do
    hash = {:person => {:title => 'mr', :name => {:first => 'ben', :last => 'snape'}, :interests => 'football'}}
    @mercury.find_value_in_hash(:interests, hash).should == 'football'
  end

  describe 'the calculate_week method'

  it 'should return seven different values' do
    @mercury.calculate_week.to_set.size.should == 7
  end

end
