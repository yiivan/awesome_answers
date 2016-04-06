class WelcomeController < ApplicationController

  # this defines an `action` called index for the `WelcomeController`
  def index
    # render text: "Hello World!"

    # By default (convention) Rails will render:
    # views/welcome/index.html.erb (when receving a request that has an HTML format)
    # you can also do:
    # render :index
    # or
    # render "/some_other_folder/some_other_action"

    # if you use another format by going to url such as `/home.text`
    # Rails will render a template according to that format so in the case of
    # `/home.text` it will be:
    # views/welcome/index.text.erb
  end

  def about

  end
end
