+++
title = "Contribute to Code"
date = 2019-05-24T21:15:52+02:00
weight = 10
chapter = false
pre = ""
alwaysopen = true
+++

So you decided to contribute to some of [repository](https://github.com/elastos). Before contribution you should follow those rules:

* **Always make a new branch for your work, no matter how small.** This makes it easy for others to take just that one set of changes from your repository, in case you have multiple unrelated changes floating around.
* **Don’t submit unrelated changes in the same branch/pull request!** The maintainer shouldn’t have to reject your awesome bugfix because the feature you put in with it needs more review.
* **Bug fixes** should be based on the branch named after the oldest supported release line the bug affects.
    * E.g. if a feature was introduced in 1.1, the latest release line is 1.3, and a bug is found in that feature - make your branch based on 1.1. The maintainer will then forward-port it to 1.3 and master.
    * Bug fixes requiring large changes to the code or which have a chance of being otherwise disruptive, may need to base off of master instead. This is a judgement call – ask the devs!
* **New features** should branch off of the ‘master’ branch.
    * Note that depending on how long it takes for the dev team to merge your patch, the copy of master you worked off of may get out of date! If you find yourself ‘bumping’ a pull request that’s been sidelined for a while, make sure you rebase or merge to latest master to ensure a speedier resolution.
* **Follow the style you see used in the primary repository!** Consistency with the rest of the project always trumps other considerations. It doesn’t matter if you have your own style or if the rest of the code breaks with the greater community - just follow along.
* **Documentation isn’t optional**. Patches without documentation will be returned to sender. By “documentation” we mean:
    * **Docstrings** must be created or updated for public API functions/methods/etc.
    * New features should ideally include updates to prose documentation, including useful example code snippets.
    * All submissions should have a changelog entry crediting the contributor and/or any individuals instrumental in identifying the problem.
* **Tests aren’t optional**. Any bugfix that doesn’t include a test proving the existence of the bug being fixed, may be suspect. We’ve found that test-first development really helps make features better architected and identifies potential edge cases earlier instead of later. Writing tests before the implementation is strongly encouraged.

### Pull Requests

* Describe why are you doing this PR.
* Do not include issue numbers in the PR title.
* Include screenshots and animated GIFs in your pull request whenever possible.
* End all files with a newline.
* Please rebase or merge and resolve all conflicts before submitting.
* Please ensure the necessary checks pass and that code coverage does not decrease.
* If you are asked to update your pull request with some changes there's no need to create a new one. Push your changes to the same branch.

### Commit messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 50 characters or less
* Reference issues and pull requests liberally after the first line
* Consider starting the commit message with an applicable emoji:
    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :memo: `:memo:` when writing docs
    * :penguin: `:penguin:` when fixing something on Linux
    * :apple: `:apple:` when fixing something on macOS
    * :checkered_flag: `:checkered_flag:` when fixing something on Windows
    * :bug: `:bug:` when fixing a bug
    * :fire: `:fire:` when removing code or files
    * :white_check_mark: `:white_check_mark:` when adding tests
    * :arrow_up: `:arrow_up:` when upgrading dependencies
    * :arrow_down: `:arrow_down:` when downgrading dependencies
    * :shirt: `:shirt:` when removing linter warnings

Please follow [the seven rules of a great Git commit message](https://chris.beams.io/posts/git-commit/#seven-rules)

### Example of Contribution

Here’s an example workflow for a project theproject hosted on Github, which is currently in version 1.3.x. Your username is yourname and you’re submitting a basic bugfix.

#### Preparing your fork

1. Hit "Fork" on Github, creating e.g. `yourname/theproject`.
2. Clone your project: `git clone git@github.com:yourname/theproject`.
3. Create a branch: `cd theproject; git checkout -b foo-the-bars 1.3`.


#### Do your changes

1. Add `CHANGELOG` entry crediting yourself.
2. Write tests expecting the correct/fixed functionality; make sure they fail.
3. Code.
4. Run tests again, making sure they pass.
5. Commit your changes: `git commit -m "Foo the bars"`.

#### Creating PR (Pull Request)

1. Push your commit to get it back up to your fork: `git push origin HEAD`
2. Visit Github, click handy "Pull request" button that it will make upon noticing your new branch.
3. In the description field, write down issue number (if submitting code fixing an existing issue) or describe the issue + your fix (if submitting a wholly new bugfix).
4. Hit "Submit". Please be patient - the maintainers will get to you when they can.
