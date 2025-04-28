create_subtree() {
    # Create a test repo
    mkdir test && cd test && git init

    # Create a README
    echo "test" > README.md
    git add README.md && git commit -m "Add README"

    # Create a directory and file
    mkdir mydir
    echo "content" > mydir/file.txt
    git add mydir && git commit -m "Add mydir"

    # Rename the directory
    git mv mydir newdir
    git commit -m "Rename directory"

    # Try subtree split
    git subtree split --prefix=newdir -b newdir-only

    # Check what commits are included
    git log newdir-only
}

delete_subtree() {
    # Create a test repo
    mkdir test && cd test && git init

    # Create a README
    echo "test" > README.md
    git add README.md && git commit -m "Add README"

    # Create a directory and file
    mkdir mydir
    echo "content" > mydir/file.txt
    git add mydir && git commit -m "Add mydir"

    # Rename the directory
    git rm mydir
    git commit -m "Rename directory"

    # Create a directory and file
    mkdir mydir
    echo "content" > mydir/file.txt
    git add mydir && git commit -m "Add re-add mydir"

    # Try subtree split
    git subtree split --prefix=mydir -b newdir-only

    # Check what commits are included
    git log newdir-only
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
    echo "content" > mydir/file.txt
    git add mydir && git commit -m "Add mydir"

    # Rename the directory
    git mv mydir newdir
    git commit -m "Rename directory"

    echo "content" > newdir/file.txt
    git add newdir && git commit -m "altering newdir"

    # Rename the directory
    git mv newdir mydir
    git commit -m "ReRename directory"

    # Try subtree split
    git subtree split --prefix=mydir -b mydir-only

    # Check what commits are included
    git log mydir-only
}
