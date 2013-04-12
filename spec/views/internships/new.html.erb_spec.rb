require 'spec_helper'

describe "internships/new" do
  before(:each) do
    assign(:internship, stub_model(Internship,
      :orientation => "MyString",
      :programming_language => "MyString",
      :salary => 1.5,
      :working_hours => 1.5,
      :living_costs => 1.5
    ).as_new_record)
  end

  it "renders new internship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", internships_path, "post" do
      assert_select "input#internship_orientation[name=?]", "internship[orientation]"
      assert_select "input#internship_programming_language[name=?]", "internship[programming_language]"
      assert_select "input#internship_salary[name=?]", "internship[salary]"
      assert_select "input#internship_working_hours[name=?]", "internship[working_hours]"
      assert_select "input#internship_living_costs[name=?]", "internship[living_costs]"
    end
  end
end
