function newjupyter
    if test (count $argv) -eq 0
        echo "Usage: newjupyter <filename>"
        return 1
    end

    set filename $argv[1]

    # ensure it has .py extension
    if not string match -q "*.py" $filename
        set filename "$filename.py"
    end

    # create the .py file if it doesn't exist
    if not test -f $filename
        touch $filename
        echo "Created $filename"
    else
        echo "$filename already exists"
    end

    # pair with ipynb via jupytext
    jupytext --set-formats ipynb,py:percent $filename
    echo "Paired $filename with $filename.ipynb"
end
