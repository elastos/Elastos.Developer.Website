+++
title = "Report Bugs"
date = 2019-05-24T21:15:52+02:00
weight = 20
chapter = false
pre = ""
alwaysopen = true
+++

This section guides you through submitting a bug. Following these guidelines helps maintainers and the community understand how to reproduce the behavior, and find related reports.

Before reporting bug, please perform basic troubleshooting steps:

* **Make sure you’re on the latest version**. If you’re not on the most recent version, your problem may have been solved already! Upgrading is always the best first step.
* Try older versions. If you’re already on the latest release, try rolling back a few minor versions (e.g. if on 1.7, try 1.5 or 1.6) and see if the problem goes away. This will help the devs narrow down when the problem first arose in the commit log.
* Try switching up dependency versions. If the software in question has dependencies (other libraries, etc) try upgrading/downgrading those as well.
* Determine [which repository the enhancement should be suggested in](https://github.com/elastos/Elastos)
* Search the repository issues to make sure it’s not a known issue.

If you don’t find a pre-existing bug, consider checking with the [Elastos Community Telegram](https://t.me/elastosgroup) channel in case the problem is non-bug-related.

When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-bug-report). Fill out [the required template](ISSUE_TEMPLATE.md), the information it asks for helps us resolve issues faster.

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### How Do I Submit A Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). After you've determined [which repository](https://github.com/elastos) your bug is related to, create an issue on that repository and provide the following information by filling in [the template](ISSUE_TEMPLATE.md).

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you make a build, e.g. which command exactly you used in the terminal, or if you used Docker.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. You can use [this tool](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
* **If you're reporting that program crashed**, include a crash report with a stack trace .
* **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Include details about your configuration and environment:

* **Which version of repo are you using?** You can get the exact commit hash by running `git log -p -2` in your terminal.
* **What's the name and version of the OS you're using**?
* **Are you running app in a virtual machine or Docker?** If so, which VM software are you using and which operating systems and versions are used for the host and the guest?
* **Which required packages do you have installed?** 
