require 'spec_helper'

describe 'Sales' do
  describe 'Submit form without a file' do
    it 'renders "No file selected" error' do
      visit sales_load_path
      click_on 'Upload'
      page.should have_content('No file selected')
    end
  end

  describe "Submit a valid file" do
    it 'renders the total' do
      visit sales_load_path
      attach_file('sales', 'files/example_input.tab')
      click_on 'Upload'
      page.should have_content('Last load total amount gross revenue: 95.0')
    end
  end
end

