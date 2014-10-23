LeGit
=====


LeGit is a bunch of bash functions and aliases dedicated to easy the commit process through Git.

It is under development right now but some feature are already available.
More details about them will coming soon.

To use LeGit, clone the repository in your home directory then add the following statements to your `.bash_profile`.
``` bash
if [ -f ~/legit/main.sh ]; then
  . ~/legit/main.sh
fi
```

WARNING : LeGit is mainly some custom function I made on my own whenever it was needed on one of my projects. I can not guaranty fully support on all system. 
It has been created to work on MacOS operating system and iTerm terminal.


Usage
----

### Commit

```
$	commit
$	commit --b branchName
$	commit --branch branchName
```


### Status

The `status` statement is another way to call `git status`. It is a more colorful way to display modification on file in git repository.

```
$	status
```
You can also display a list of commits not yet pushed to remote server by using `-c` parameter
```
$	status -c
```

### Www

The `www` statement is an alias of `cd /Application/MAMP/htdocs`

```
$	www
```
It handle one argument which will be the name of the directory you wish to go into `cd /Application/MAMP/htdocs`.
The following statement will count as  `cd /Application/MAMP/htdocs/dummy`

```
$	www dummy
```

### Pane

The `pane` is a bunch of command usable with iTerm
```
$ 	pane
```

Split the pane vertically
```
$ 	pane -sv
```

Split the pane horizontally
```
$ 	pane -sh
```

Move your caret to next pane
```
$ 	pane -n
```

Move caret to previous pane
```
$ 	pane -p
```

Open a new tab
```
$ 	pane -t
```
