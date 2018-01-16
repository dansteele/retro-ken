# Retro Ken

[![Code Climate](https://codeclimate.com/github/dansteele/retro-ken/badges/gpa.svg)](https://codeclimate.com/github/dansteele/retro-ken)  [![Issue Count](https://codeclimate.com/github/dansteele/retro-ken/badges/issue_count.svg)](https://codeclimate.com/github/dansteele/retro-ken) [![Build Status](https://travis-ci.org/dansteele/retro-ken.svg?branch=master)](https://travis-ci.org/dansteele/retro-ken)

---------

Retro Ken is a bot for automating your retrospectives with your team. It is based on the awesome [slack-ruby-bot](https://github.com/slack-ruby/slack-ruby-bot).

![Example](http://i.imgur.com/2zAfyVV.png)

# Install (quick)

To get up and running off your local machine, just [add a new bot](http://slack.com/services/new/bot), then run
```bash
SLACK_API_TOKEN=my-token-from-slack RACK_ENV=production rackup config.ru -p 24558
```

# Commands

Ken expects there to be no more than one Retrospective being referenced at any point. An advantage of this is you can interact with the same retrospective in either one large chat, or via DMs to Ken.

Either speak to Ken publicly with `@retro-ken`, or you can leave this out when speaking to him in a DM.

### Retrospectives
Start / stop a retrospective

```
retro start
retro stop
```

### Adding a thought
A thought is either a 'continue' or 'stop' thought.
You can send a thought to Ken when there's a retrospective running.
Like the way something is being done in your company?
Message ken with something like

`+ I love the new reviewing process`

Want something to change?

`- The new reviewing process is too time consuming`

### Anonymity
Append 'anon' to the end of your thought. Anonymity is applied to _each_ thought. This enables those who are worried about speaking up about a certain issue to do so.

`- Directionless company branding anon`

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
