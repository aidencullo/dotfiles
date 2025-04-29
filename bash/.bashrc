create_subtree() {
    # Create a test repo
    rm -rf test
    mkdir test && cd test && git init

    # Create a README
    echo "test" > README.md
    git add README.md && git commit -m "Add README"

    # Create a directory and file
    mkdir mydir
    echo "content" > mydir/file.txt
    git add mydir && git commit -m "Add mydir"

    echo "content" >> mydir/file.txt
    git add mydir && git commit -m "Add to mydir"

    # Try subtree split
    git subtree split --prefix=mydir -b mydir-only -d

    # Check what commits are included
    git log mydir-only
}

rename_subtree() {
    # Create a test repo
    rm -rf test
    mkdir test && cd test && git init

    # Create a README
    echo "test" > README.md
    git add README.md && git commit -m "Add README"

    # Create a directory and file
    mkdir mydir
    echo "content" >> mydir/file.txt
    git add mydir && git commit -m "Add mydir"

    # Rename the directory
    git mv mydir newdir
    git commit -m "Rename directory"

    echo "content" >> newdir/file.txt
    git add newdir && git commit -m "altering newdir"

    # Rename the directory
    git mv newdir mydir
    git commit -m "ReRename directory"

    # Try subtree split
    git subtree split --prefix=mydir -b mydir-only -d

    # Check what commits are included
    git log mydir-only
}
