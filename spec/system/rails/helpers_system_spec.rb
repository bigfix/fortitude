describe "Rails helper support", :type => :rails do
  uses_rails_with_template :helpers_system_spec

  it "should support the built-in Rails helpers by default" do
    expect_match("basic_helpers",
      /Three months ago: 3 months/mi,
      /A million dollars: \$1,000,000\.00/mi,
      %r{Select datetime:\s*<select.*name="date.*>.*<option.*value="2014".*</option>}mi)
  end

  it "should support helpers that use blocks" do
    expect_match("block_helpers",
      %r{<body>\s*<form.*action="/form_dest".*>.*<input.*authenticity_token.*/>.*<p>inside the form</p>.*</form>}mi,
      %r{})
  end

  it "should support built-in Rails helpers that output, rather than render, properly" do
    expect_match("built_in_outputting_helpers",
      %r{<div class=.concat_container.>.*this is concatted.*</div>.*<div class=.safe_concat_container.>.*this is safe_concatted.*</div>}mi)
  end

  it "should support custom-defined helpers" do
    expect_match("custom_helpers_basic", %r{excited: awesome!!!})
  end

  it "should support custom-defined helpers that output, rather than render, properly" do
    expect_match("custom_helper_outputs", %r{how awesome: super awesome!})
  end

  it "should allow changing a built-in Rails helper from outputting to rendering"
  it "should allow changing a built-in Rails helper from rendering to outputting"
  it "should allow changing a custom-defined helper from outputting to rendering"
  it "should allow changing a custom-defined helper from rendering to outputting"

  it "should respect the Rails include_all_helpers setting"
  it "should allow access to controller methods declared as helpers"
  it "should allow access to methods explicitly imported as helpers"

  it "should automatically expose helpers in app/helpers just like Rails does"
  it "should allow turning off automatic loading of helpers from app/helpers"
end
