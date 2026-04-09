function newjupyter
    if test (count $argv) -eq 0
        echo "Usage: newjupyter <filename>"
        return 1
    end

    set -l filename $argv[1]
    set -l env_name (basename $PWD)

    if not string match -q "*.py" $filename
        set filename "$filename.py"
    end

    # Create the .py file if it doesn't exist
    if not test -f $filename
        echo "# %%" >$filename
        echo "Created $filename with percent header"
    else
        echo "$filename already exists"
    end

    # Pair with ipynb via jupytext
    # Note: Jupytext will create the .ipynb file automatically here
    jupytext --set-formats ipynb,py:percent $filename
    echo "Paired $filename with .ipynb"

    # Register kernel
    if set -q VIRTUAL_ENV
        echo "Registering kernel for virtual environment: $env_name"
        python -m ipykernel install --user --name="$env_name" --display-name "Python ($env_name)"
    else
        echo "Warning: No virtual environment detected. Kernel not registered."
    end
end
