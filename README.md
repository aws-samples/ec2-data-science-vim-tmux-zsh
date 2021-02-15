# Simple setup Data Science development with tmux, zsh, and vim

A simple guide to setting up basic Vim, Tmux, Zsh for the Deep Learning AMI
Amazon Linux 2 and MAC OS for data scientists.

After setting up the environment it should look something like this.

![images/screenshot.png](images/screenshot.png)

There are three aspects to this setup:
- Edit/navigate and run code in the same window simultaneously using
  [Tmux](https://github.com/tmux/tmux/wiki).
- Develop code with [Vim](https://www.vim.org/), configured with popular
  plugins and sensible defaults.
- Enable directory navigation and display git branch/status with [Oh My
  Zsh](https://ohmyz.sh/).

## Getting started

    ./deploy.sh

[![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?#/stacks/new?stackName=data-science-dev-env&templateURL=https://raw.githubusercontent.com/aws-samples/ec2-data-science-vim-tmux-zsh/main/templates/ec2.yml)

