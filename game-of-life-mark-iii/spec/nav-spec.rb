require_relative '../lib/navigator'

describe Navigator do
  context "when the Navigator starts" do
    it "takes a two dimetional array" do
      nav = Navigator.new([[0,1],[1,0]])
      expect(nav.cells).to eq([[0,1],[1,0]])
    end
  end

  

end
