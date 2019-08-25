"""Utility macro used for extracting an specific extern file from js-compiler binary."""

def extern(name, path = None):
    """Extract a specific extern file from the extern files provided by the jscompiler binary"""
    if not path:
        path = "%s.js" % name

    native.alias(
        name = "%s.js" % name,
        actual = "@com_google_closure_compiler//:externs/%s" % (path),
    )
