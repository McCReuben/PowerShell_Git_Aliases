function gitstatus { git status $args }
Set-Alias -Name gs -Value gitstatus

function gitbranch { git branch $args }
Set-Alias -Name gb -Value gitbranch

function gitpush { git push $args }
Set-Alias -Name gp -Value gitpush -Force

function gitreset { git reset $args }
Set-Alias -Name gr -Value gitreset

function gitadd { git add $args }
Set-Alias -Name ga -Value gitadd

function gitadd_all { 
    git add --all
    gitstatus
}
Set-Alias -Name gaa -Value gitadd_all

function gitcheckout { git checkout $args }
Set-Alias -Name gco -Value gitcheckout

function gitcommit_msg { git commit -m $args }
Set-Alias -Name gcm -Value gitcommit_msg -Force

