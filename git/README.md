## Git scripts 

These are some git related scripts to facilitate work for Skycoin/Skywire. 


### Add remote script

The script checks the current directory and if it recognizes it as a Skywire-related repository, it adds and updates a number of well-known remotes. 

It can be aliases and invoked with:

```
alias $aliasName="curl https://raw.githubusercontent.com/jdknives/scripts/master/git/add_remote.sh | bash" 
```

If you have security considerations because you run this script often and do not want to check for malicious code, clone the repo and use following alias:

```
alias $aliasName="$pathToScript"
```

Update the script every now and then to receive updates for potential new well know remotes. 
