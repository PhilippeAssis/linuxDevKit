gitall(){
    if [ -z "$1" ]; then
        git add --all && git commit -m all && git push
    else
        str="'$*'"
        git add --all && git commit -m "$str" && git push
    fi
}

# gittag $tag $comment
#if package.json exists, using package version
gittag(){
packagejson="$PWD/package.json"

if [ -e $packagejson ]; then
	packegeversion=$(cat package.json | grep -Po '(?<="version": ")[^"]*')
	if [ -z "$1" ]; then
		gitcommand="git tag -a $packegeversion -m $packegeversion"		
	else
		gitcommand="git tag -a $packegeversion -m $1"
	fi
else
	if [ -z "$2" ]; then
		gitcommand="git tag -a $1 -m $1"
	else
		gitcommand="git tag -a $1 -m \"$2\""
	fi
fi


eval "$gitcommand && git push origin --tags"
}

gitnpmtag(){
packagejson="$PWD/package.json"

if [ -e $packagejson ]; then
	packegeversion=$(cat package.json | grep -Po '(?<="version": ")[^"]*')
	if [ -z "$1" ]; then
		gitcommand="git tag -a $packegeversion -m $packegeversion"		
	else
		gitcommand="git tag -a $packegeversion -m $1"
	fi
else
	if [ -z "$2" ]; then
		gitcommand="git tag -a $1 -m $1"
	else
		gitcommand="git tag -a $1 -m \"$2\""
	fi
fi

if [ -e $packagejson ]; then
	eval "$gitcommand && git push origin --tags && npm publish"
else
	eval "$gitcommand && git push origin --tags"
fi
}

appversion(){
    cat package.json | grep -Po '(?<="version": ")[^"]*'
}
