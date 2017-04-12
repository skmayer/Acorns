## Install Ruby

    Install Homebrew: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    Install Ruby: brew install ruby

## Install Cucumber

If you're using rvm-installed ruby:

    gem install bundler
    bundle install
    cucumber --version

Or directly install cucumber:

    gem install cucumber

## To run the code

    # OS X
    Open Terminal
    $ cd /acorns  #open acorns folder
    $ cucumber  #this will kick start all the cucumber feature files

## Folder Structure

    -Acorns
        -failed_png             #failed screenshot container
        -success_png            #passed screenshot container
        -features
          -api
            -edmunds.feature    #Cucumber BDD file that tests the Edmunds API
          -ui
            -redfin.feature     #Cucumber BDD file that tests Redfin website
          -step_definitions     #contains all the step definiftions and logic
            -api                
              -edmunds.rb
            -ui
              -home_page
                home_steps.rb
              -login_page
                login_steps.rb
              -results_page
                -results_steps.rb
          -support
            -classes            #helper object files
            -env.rb             #sets up all the gems and the browser
            -Hooks.rb           #sets the Before & After scenario behavir

  ## Notes

    -Edumunds Vehicle API only allows 25 calls per day. So the calls will fail once you've reached that limit.
    -Successful/Failed tests will create a screenshot and save in the respective folder under \Acorns.
  
