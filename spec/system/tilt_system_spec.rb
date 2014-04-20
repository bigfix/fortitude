require "tilt"
require "fileutils"

describe "Fortitude Tilt integration", :type => :system do
  def tempdir
    @tempdir ||= begin
      out = File.join(File.dirname(File.dirname(__FILE__)), 'tmp', 'spec', 'tilt_system_spec')
      FileUtils.rm_rf(out)
      FileUtils.mkdir_p(out)
      out
    end
  end

  def splat!(filename, text)
    full_path = File.join(tempdir, filename)
    FileUtils.mkdir_p(File.dirname(full_path))
    File.open(full_path, 'w') { |f| f << text }
    full_path
  end

  def render_with_tilt(full_path, evaluation_scope = Object.new, variables = { })
    template = Tilt.new(full_path)
    template.render(evaluation_scope, variables)
  end

  it "should render a very simple template via Tilt" do
    text = <<-EOS
class SimpleTemplate < Fortitude::Widget::Html5
  def content
    text "this is"
    p "a simple widget"
    text "!"
  end
end
EOS

    full_path = splat!("simple_template.rb", text)

    expect(render_with_tilt(full_path)).to eq("this is<p>a simple widget</p>!")
  end

  it "should pass explicit locals to the template"
  it "should make variables defined on the context object available to the template"
  it "should make explicit locals override variables defined on the context object"
  it "should allow helpers defined on the context object to be invoked via automatic helper support"
  it "should allow helpers defined on the context object to be invoked via explicit helper support"

  it "should still render a widget that's directly in a module (class Foo::Bar::Baz < Fortitude::Widget::Base)"
  it "should still render a widget that's directly in a module, of a subclass of Widget::Base (class Foo::Bar::Baz < MyWidget)"
  it "should still render a widget that's in a module via namespace nesting (module Foo; module Bar; Baz < Fortitude::Widget::Base)"
  it "should still render a widget that's in a module via namespace nesting, of a subclass of Widget::Base (module Foo; module Bar; Baz < MyWidget)"

  it "should allow overriding the class that's defined in the module explicitly with an option"
  it "should allow overriding the class that's defined in the module explicitly with a comment in the template"
end