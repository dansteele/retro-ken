# Retro Ken

[![Code Climate](https://codeclimate.com/github/dansteele/retro-ken/badges/gpa.svg)](https://codeclimate.com/github/dansteele/retro-ken)  [![Issue Count](https://codeclimate.com/github/dansteele/retro-ken/badges/issue_count.svg)](https://codeclimate.com/github/dansteele/retro-ken) [![Build Status](https://travis-ci.org/dansteele/retro-ken.svg?branch=master)](https://travis-ci.org/dansteele/retro-ken)

---------

Retro Ken is a bot for automating your retrospectives with your team. It is based on the awesome [slack-ruby-bot](https://github.com/slack-ruby/slack-ruby-bot).

![Example](http://i.imgur.com/2zAfyVV.png)

# Commands

Ken expects there to be no more than one Retrospective being referenced at any point. An advantage of this is you can interact with the same retrospective in either one large chat, or via DMs to Ken.

Either speak to Ken publicly with `@retro-ken`, or you can leave this out when speaking to him in a DM.

### Retrospectives
Start / stop a retrospective

```
retro start
retro stop
```

### Voting
To spit out a list for people to vote on, use
```
retro messages
```

### Summaries
To view the results
```
retro summary
```
This prints out all of the messages that had a reaction in order of positivity, and displays the quantity of each reaction.

```
retro summary quick
```
Shows how many positive/negative messages there were.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).
