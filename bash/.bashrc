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

    # Rename the directory
    git mv mydir newdir
    git commit -m "Rename directory"

    # Try subtree split
    git subtree split --prefix=newdir -b newdir-only -d

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
    echo "content" >> mydir/file.txt
    git add mydir && git commit -m "Add mydir"

    # Rename the directory
    git mv mydir newdir
    git commit -m "Rename directory"

    # Rename the directory
    git mv newdir mydir
    git commit -m "ReRename directory"

    # Try subtree split
    git subtree split --prefix=mydir -b mydir-only -d

    # Check what commits are included
    git log mydir-only
}


delete_subtree() {
    rm -rf test
    mkdir test && cd test && git init

    echo "test" > README.md
    commit


    mkdir mydir
    echo "content" >> mydir/file.txt
    commit

    rm -rf mydir
    commit

    mkdir mydir
    echo "content" >> mydir/file.txt
    commit

    git subtree split --prefix=mydir -b mydir-only -d

    git log mydir-only
}


rename_subtree_and_commit() {
    rm -rf test
    mkdir test && cd test && git init

    echo "test" > README.md
    commit


    mkdir mydir
    echo "content" >> mydir/file.txt
    commit

    mv mydir newdir
    commit

    echo "content" >> newdir/file.txt
    commit

    echo "content" >> newdir/file.txt
    commit

    echo "content" >> newdir/file.txt
    commit

    echo "content" >> newdir/file.txt
    commit

    mv newdir mydir
    commit

    git subtree split --prefix=mydir -b mydir-only -d

    git log mydir-only
}

