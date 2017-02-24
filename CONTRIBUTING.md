## Fork the Project

Fork the [project on Github](https://github.com/dansteele/retro-ken) and check out your copy.

```
git clone https://github.com/<your_username>/retro-ken.git
cd retro-ken
git remote add upstream https://github.com/dansteele/retro-ken.git
```

## Bundle Install and Test

Ensure that you can build the project and run tests.

```
bundle install
RACK_ENV=test bundle exec rake db:create db:migrate
```

## Run retro-ken in development

Create a private slack group for yourself.

Create a new Bot Integration under [services/new/bot](http://slack.com/services/new/bot).

On the next screen, note the API token.

Run `SLACK_API_TOKEN=<your token> RACK_ENV=production foreman start`.

You can also create a `.env` file with `SLACK_API_TOKEN=<your API token>` and just run `foreman start`.

## Create a Topic Branch

Make sure your fork is up-to-date and create a topic branch for your feature or bug fix.

```
git checkout master
git pull upstream master
git checkout -b my-feature-branch
```

## Write Tests

Try to write a test that reproduces the problem you're trying to fix or describes a feature that you want to build.
Add to [spec](spec).

We definitely appreciate pull requests that highlight or reproduce a problem, even without a fix.

## Write Code

Implement your feature or bug fix.

Ruby style is enforced with [Rubocop](https://github.com/bbatsov/rubocop).
Run `bundle exec rubocop` and fix any style issues highlighted.

Make sure that `bundle exec rake` completes without errors.

## Write Documentation

Document any external behavior in the [README](README.md).

## Commit Changes

Make sure git knows your name and email address:

```
git config --global user.name "Your Name"
git config --global user.email "contributor@example.com"
```

Writing good commit logs is important. A commit log should describe what changed and why.

```
git add ...
git commit
```

## Push

```
git push origin my-feature-branch
```

## Make a Pull Request

Go to https://github.com/<your_username>/retro-ken and select your feature branch.
Click the 'Pull Request' button and fill out the form. Pull requests are usually reviewed within a few days.

## Check on Your Pull Request

Go back to your pull request after a few minutes and see whether it passed muster with Travis-CI. Everything should look green, otherwise fix issues and amend your commit as described above.

## Be Patient

It's likely that your change will not be merged and that the nitpicky maintainers will ask you to do more, or fix seemingly benign problems. Hang on there!

## Thank You

Please do know that we really appreciate and value your time and work. We love you, really.
