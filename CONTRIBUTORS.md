# Contributors to Fortitude

Fortitude is written by [Andrew Geweke](https://github.com/ageweke), with contributions from:

* [`tobymao`](https://github.com/tobymao): reporting a bug where trying to declare a method `static` before it's been
  defined resulted in a confusing error.
* [Ahto Jussila](https://github.com/ahto): a patch to provide separate MRI and JRuby gems, so that
  `gem install fortitude` works properly no matter which platform you're on.
* [Roman Heinrich](https://github.com/mindreframer): reporting a bug where trying to use Fortitude as a Tilt
  engine to render would fail if the locals passed in were `nil`.
* [Jacob Maine](https://github.com/mainej):
  * Reporting the lack of `ActionMailer` support for Fortitude, and offering a patch to add it;
  * Reporting a bug where view classes ending in `.html.rb` would encounter classloading issues
    (resulting in `uninitialized constant` or `superclass mismatch` errors) in development mode.
* [Leaf](https://github.com/leafo) for:
  * Reporting slow widget classloading in very large systems due to eager, not lazy, complication of `needs`-related
    methods, and significant work helping determine that widget localization support was a major source of slowness
    here.
  * Reporting the need for support for passing blocks to `widget`, and thus being able to `yield` from one widget
    to another.
  * Discussion and details around exactly what `:attribute => true`, `:attribute => false`, and so on should render
    from Fortitude.
  * Reporting multiple bugs in support for `render :widget => ...`, and many useful pointers to possible fixes and
    additional methods to make the implementation a lot more robust.
  * Reporting a bug, tracking down the exact cause, and providing a fix for a case where the closing tag of an element
    would get written to the wrong output buffer if the output buffer was changed inside the element (as could happen
    with, among other things, Rails' `cache` method).
  * Reporting a bug where overriding a "needs" method would work only for the class it was defined on, and not any
    subclasses.
  * Reporting an issue where the module Fortitude uses to mix in its "needs" methods was not given a name, and instead
    the module it used to mix in helper methods was given two names, one of them incorrect.
  * Reporting a bug where using `#capture` inside a widget being rendered via `render :widget => ...` would not work
    properly.
  * Reporting a bug where doing something like `div(nil, :class => 'foo')` would produce just `<div></div>` instead of
    the desired `<div class="foo"></div>`.
  * Reporting an issue where `return`ing from inside a block passed to a tag method would not render the closing tags.
  * Reporting, and helping verify, an issue where creating anonymous subclasses of a Fortitude widget class (like
    those used by `render :inline`) would cause those anonymous subclasses to never be garbage collected, causing
    a memory leak.
  * Reporting an issue where use of Rails' `form_for` and/or `fields_for` from within another `form_for` or
    `fields_for` block would not produce the correct output.
  * Reporting an issue where, under certain extremely rare circumstances, adding a view path in the controller (using
    [`ActionView::ViewPaths.append_view_path`](http://api.rubyonrails.org/classes/ActionView/ViewPaths/ClassMethods.html#method-i-prepend_view_path)
    and related methods) would not be able to figure out the proper class name of the widget, and would fail.
* [Adam Becker](https://github.com/ajb) for:
  * Discussion and details around exactly what `:attribute => true`, `:attribute => false`, and so on should render
    from Fortitude.
  * Reporting an issue where you could not easily render a Fortitude widget from Erector, nor vice-versa.
  * Fixes for compatibility with Rails 5.
  * Fix for a deprecation warning from Rails 5 caused by Fortitude's use of `render :text` internally.
  * Reporting an issue and providing a test case and patch for an issue where calling `f.label` with a block, where
    `f` is the object yielded to Rails' `form_for`, would cause an exception from Fortitude.
  * Reporting an issue where Fortitude was escaping characters that it didn’t need to in attribute values
    (specifically, `<`, `>`, and `'`).
  * Reporting an issue where you couldn't use `inline_html` in a way that allowed you to pass a
    `Fortitude::RenderingContext`, thus preventing you from using it with code that required access to helpers.
  * Reporting an issue where Rails' `_url`/`_path` helpers wouldn't pick up parameters set from the inbound request
    correctly.
* [Karl He](https://github.com/karlhe) for:
  * Reporting an issue (and supplying an example patch) where Fortitude wasn't respecting Rails' additional view
    paths correctly &mdash; only `app/views`.
* [Jeff Dickey](https://github.com/jdickey) for:
  * Reporting an issue where `#block_given?` inside a Fortitude widget's `#content` method returned `true` always,
    whether or not there was anything to yield to.
* [Luke Francl](https://github.com/look) for:
  * Reporting an incompatibility between Fortitude and Rails 4.2.5.1, and discovering the underlying cause (a fifth
    parameter added to `ActionView::PathResolver#find_templates`.)
* [Victor Lymar](https://github.com/vlymar) for:
  * Fixes for compatibility with Rails 5.
* [Matt Walters](https://github.com/mattwalters) for:
  * A patch to make built-in Rails helpers work even when `automatic_helper_access` was set to `false`.
* [Gaelan](https://github.com/Gaelan) for:
  * Suggesting generator support for Fortitude.
