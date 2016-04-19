require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe "MovieLovers" do
  describe "home page" do
    it "works properly" do
      get '/'
      expect(last_response).to be_ok
    end
    it "asks for a term to start playing" do
      get '/'
      expect(last_response.body.downcase).to include("welcome")
    end
  end
end



