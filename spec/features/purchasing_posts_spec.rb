require 'rails_helper'

describe 'with prices' do

	before do
		Post.create(price: 100)
	end

end
