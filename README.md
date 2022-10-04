# Deployment repo for docker-pkg

Everything done from repo root

## First setup
```
git submodule update --init
```

## Update docker-pkg sources
```
git -C src checkout <my_version_tag>
```

## Check dependency updates
```
python -m venv venv
. venv/bin/activate
pip install --no-deps -r frozen-requirements.txt
pip install ./src
diff -U0 frozen-requirements.txt <(pip freeze)
```
Use your judgement for which dependencies need updating.
In general, if it's not in `setup.py` within `install_requires`, it's not needed to change it.
If you want to update all deps:
```
pip freeze --exclude docker-pkg > frozen-requirements.txt
```

## Build the artifacts locally
```
make -f Makefile.build
```
Remember to check the diff the Makefile outputs.

## Commit your changes
```
git add src  # Register the submodule update
git add frozen-requirements.txt
git add artifacts/*.tar.gz
git commit -m "Updating docker-pkg to $(git -C src describe --tags)"
```
