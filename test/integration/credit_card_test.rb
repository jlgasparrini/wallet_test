require 'rails_helper.rb'

feature 'Creating credit card' do
  scenario 'can create a cc' do
    visit '/credit_cards'

    click_link 'ADD A NEW CARD'

    fill_in 'credit_card[card_number]', with: '4111 1111 1111 1111'
    fill_in 'credit_card[expiration_date]', with: '12/2020'
    fill_in 'credit_card[security_code]', with: '123'

    click_button 'Save Card'

    expect(page).to have_content '**** **** **** 1111'
  end
end

feature 'Deleting credit card' do
  scenario 'can delete a cc' do
    CreditCard.create({
      card_number: '4111 1111 1111 1111',
      expiration_date: '12/2020',
      security_code: '123'
    })

    visit '/credit_cards'

    find('.cc-destroy').click

    expect(page).to have_content 'Credit Card successfully removed'
  end
end
# describe "the " do
#   before(:all) do
#     @credit_cards = []
#     3.times{ @credit_cards << Fabricate(:credit_card) }
#   end

#   describe "on the index page" do
#     before(:each) do
#       visit credit_cards_path
#     end

#     it "should list the credit card numbers sanitized" do
#       @credit_cards.each do |cc|
#         page.should have_content(cc.card_number)
#       end
#     end

#     it "should have links for remove credit cards on the index" do
      
#     end
#   end
# end

# describe "the credit cards interface" do
#   describe "on the new page" do
#     before(:each) do
#       visit new_credit_card_path
#     end

#     it "should list the credit card numbers sanitized" do
#       @credit_cards.each do |cc|
#         page.should have_content(cc.card_number)
#       end
#     end

#     it "should have links for the articles on the index" do
#       # Your implementation here
#     end
#   end
# end
