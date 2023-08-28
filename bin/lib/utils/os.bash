@arch() { uname -m; }

@os() { uname -s | tr '[:upper:]' '[:lower:]'; }

@darwin() { [ "$(@os)" == 'darwin' ]; }
